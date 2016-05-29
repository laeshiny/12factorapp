package main

import (
	"github.com/gin-gonic/gin"
	"flag"
	"fmt"
)

func main() {
    flag.Parse()
	args := flag.Args()
	if len(args) < 1 {
		fmt.Println("Input argument is missing.!!")
	}

	port := args[0]

	fmt.Println("Argument:", args)

	r := gin.Default()
    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "pong",
        })
    })

	r.GET("/pong", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "ping",
        })
    })


    r.Run(":" + port) // listen and server on 0.0.0.0:8080
}