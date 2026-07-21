package routes

import (
	"calculator-api/handlers"

	"github.com/gin-gonic/gin"
)

func SetUpRoutes(r *gin.Engine) {
	api := r.Group("/api")
	{
		api.POST("/add", handlers.Add)
		api.POST("/sub", handlers.Sub)
		api.POST("/mul", handlers.Mul)
		api.POST("/div", handlers.Div)
	}
}
