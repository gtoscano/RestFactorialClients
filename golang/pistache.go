package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func getFactorial() bool {
	url := "http://localhost:8000/factorial/5"
	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("Error:", err)
		return false
	}
	defer resp.Body.Close()

	if resp.StatusCode != 200 {
		fmt.Println("Error: Expected status code 200, got", resp.StatusCode)
		return false
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error reading response body:", err)
		return false
	}

	var jsonData map[string]interface{}
	if err := json.Unmarshal(body, &jsonData); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return false
	}

	if jsonData["factorial"] != 120.0 { // JSON numbers are unmarshaled as float64
		fmt.Println("Error: Expected factorial value 120, got", jsonData["factorial"])
		return false
	}

	return true
}

func main() {
	if getFactorial() {
		fmt.Println("Test passed.")
	} else {
		fmt.Println("Test failed.")
	}
}

// @Update
