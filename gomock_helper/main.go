package main

import (
	"bufio"
	"errors"
	"flag"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
)

func main() {
	var (
		srcfile  string
		destfile string
	)
	flag.StringVar(&srcfile, "src", "", "source file of gomock")
	flag.StringVar(&destfile, "dest", "", "dest file of gomock")
	flag.Parse()

	if len(srcfile) == 0 {
		panic("empty source file")
	}

	if err := generateMockCode(destfile, srcfile); err != nil {
		log.Fatal(err)
	}
}

func generateMockCode(destfile, srcfile string) error {

	src, err := os.Open(srcfile)
	if err != nil {
		return err
	}
	defer src.Close()

	pkgName, err := readSourcePackageName(src)
	if err != nil {
		return err
	}

	return makeDestFile(destfile, srcfile, pkgName)
}

var (
	packageNameExp = regexp.MustCompile(`^package .*$`)
)

func readSourcePackageName(f io.Reader) (string, error) {
	sc := bufio.NewScanner(f)

	for sc.Scan() {
		line := sc.Text()

		if !strings.HasPrefix(line, "package") {
			continue
		}

		s := strings.TrimPrefix(line, "package")

		s = strings.TrimSpace(s)
		return s, nil
	}

	return "", errors.New("package name not found")
}

func makeDestFile(destfile, srcfile, pkgName string) error {

	mockFilename, err := makeMockFilename(destfile, srcfile)
	if err != nil {
		return err
	}

	cmd := exec.Command("mockgen", "-source", srcfile, "-destination", mockFilename, "-package", pkgName)
	return cmd.Run()
}

// 如果 destfile 有指定，则使用指定的文件名。
// 否则，通过 srcfile + "_mock.go" 的规则进行生成。
func makeMockFilename(destfile, srcfile string) (mockFilename string, err error) {
	if len(destfile) != 0 {
		return destfile, nil
	}

	ext := filepath.Ext(srcfile)
	if ext != ".go" {
		return "", errors.New("not go file")
	}

	return strings.TrimSuffix(srcfile, ext) + "_mock.go", nil
}
