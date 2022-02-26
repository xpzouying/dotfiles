package main

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestReadSourcePackageName(t *testing.T) {

	ts := []struct {
		buf     []byte
		pkgName string
	}{

		{
			buf: []byte(`// Package for test
package hello 
			
// Comments for abc
func main() {}`),
			pkgName: "hello",
		},
	}

	for _, tc := range ts {

		got, err := readSourcePackageName(bytes.NewBuffer(tc.buf))
		assert.NoError(t, err)
		assert.Equal(t, tc.pkgName, got)
	}
}

func TestMakeMockFilename(t *testing.T) {

	ts := []struct {
		dest string
		src  string
		want string
	}{
		{
			dest: "hello_123.go",
			src:  "hello.go",
			want: "hello_123.go",
		},

		{
			dest: "",
			src:  "hello.go",
			want: "hello_mock.go",
		},
	}

	for _, tc := range ts {

		got, err := makeMockFilename(tc.dest, tc.src)
		assert.NoError(t, err)
		assert.Equal(t, tc.want, got)
	}

}
