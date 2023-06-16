package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", helloHandler)
	port := "8080"
	fmt.Printf("Server listening on port %s", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World, sample go app, eric6166!")
}
