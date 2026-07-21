package tests

import "testing"

func TestAdditon(t *testing.T) {
	result :=10+20
	if result!=30{
		t.Errorf("Expected 30 got %d ",result)
	}
}
func TestMul(t *testing.T){
	result :=10*20
	if result !=200{
		t.Errorf("Expected 200 got %d",result)
	}
}
func TestSub(t *testing.T){
	result :=20-10
	if result !=10{
		t.Errorf("Expected 10 got %d",result)
	}
}
func TestDiv(t *testing.T){
	result :=20/10
	if result !=2{
		t.Errorf("Expected 2 got %d",result)
	}
}