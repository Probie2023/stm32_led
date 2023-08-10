
#include "stm32f10x.h"


//main function
int main(void)
{	
	// 开启GPIOB 端口时钟
	RCC_APB2ENR |= (1<<3);

	//清空控制PB0的端口位
	GPIOB_CRL &= ~( 0x0F<< (4*0));	
	// 配置PB0为通用推挽输出，速度为10M
	GPIOB_CRL |= (1<<4*0);

	// PB0 输出 低电平
	GPIOB_ODR &= ~(1<<0);
	
	while(1);
}

void SystemInit(void)
{
	
}

