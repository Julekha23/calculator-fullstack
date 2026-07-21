package handlers

import (
	"calculator-api/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Add(c *gin.Context){
	var req models.Numbers
	if err :=c.ShouldBindJSON(&req);err!=nil{
		c.JSON(http.StatusBadRequest,gin.H{
			"error":err.Error(),
		})
		return 
	}
	c.JSON(http.StatusOK,gin.H{
		"result":req.A+req.B,
	})
}
func Sub(c *gin.Context){
	var req models.Numbers
	if err:=c.ShouldBindJSON(&req);err!=nil{
		c.JSON(http.StatusBadRequest,gin.H{
			"error":err.Error(),
		})
		return 
	}
	c.JSON(http.StatusOK,gin.H{
		"result":req.A-req.B,
	})
}
func Mul(c *gin.Context ){
	var req models.Numbers
    if err:=c.ShouldBindJSON(&req);err!=nil{
		c.JSON(http.StatusBadRequest,gin.H{
			"error":err.Error(),
		})
		return 
	}
	c.JSON(http.StatusOK,gin.H{
		"result":req.A*req.B,
	})
}
func Div(c *gin.Context){
	var req models.Numbers
	if err:=c.ShouldBindJSON(&req);err!=nil{
		c.JSON(http.StatusBadRequest,gin.H{
			"error":err.Error(),
		})
		return 
	}
	if req.B==0{
		c.JSON(http.StatusBadRequest,gin.H{
			"error":"cannot divide by zero",
		})
		return 
	}
	c.JSON(http.StatusOK,gin.H{
		"result":req.A/req.B,
	})
}