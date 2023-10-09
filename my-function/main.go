package main

import (
	"context"
	"fmt"
	"log"

	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}

type Response struct {
	Response string `json:"response"`
}

func Handler(ctx context.Context, event MyEvent) (Response, error) {
	msg := fmt.Sprintf("Welcome %s", event.Name)
	log.Println(msg)
	response := Response{
		Response: msg,
	}

	return response, nil
}

func main() {
	lambda.Start(Handler)
}
