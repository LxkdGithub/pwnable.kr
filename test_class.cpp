#include <stdlib.h>
#include <iostream>
#include <string.h>

class CFunTest{
	public:
		int m_none;
		int m_ntwo;
		char m_szName[32];
};

void ShowFunTest(CFunTest FunTest){
	printf("%d %d %s\r\n", FunTest.m_none, FunTest.m_ntwo, FunTest.m_szName);
}

int main(){
	CFunTest FunTest;
	FunTest.m_none = 1;
	FunTest.m_ntwo = 2;
	strcpy(FunTest.m_szName, "Name");
	ShowFunTest(FunTest);
	return 0;
}
