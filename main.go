package main

import (
"github.com/gin-gonic/gin"
"calculator-api/routes"
)
func main() {
	r := gin.Default()
	routes.SetUpRoutes(r)
	r.Run(":3000")
}