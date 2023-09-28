package main

import (
	"database/sql"
	"net/http"

	_ "github.com/mattn/sqlite3"
)

func getRoot(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("hi there"))
}

type Thing struct {
	number uint64
}

func NewThing() Thing {
	return Thing{3}
}

func main() {
	http.HandleFunc("/", getRoot)
	http.ListenAndServe(":3333", nil)
	sql.Open("sqlite3")
	return
}
