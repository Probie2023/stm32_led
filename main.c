
#include "stm32f10x.h"


//main function
int main(void)
{	
	// ����GPIOB �˿�ʱ��
	RCC_APB2ENR |= (1<<3);

	//��տ���PB0�Ķ˿�λ
	GPIOB_CRL &= ~( 0x0F<< (4*0));	
	// ����PB0Ϊͨ������������ٶ�Ϊ10M
	GPIOB_CRL |= (1<<4*0);

	// PB0 ��� �͵�ƽ
	GPIOB_ODR &= ~(1<<0);
	
	while(1);
}

void SystemInit(void)
{
	
}

