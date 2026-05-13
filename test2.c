// 수제비 -> 개념 박살내기
#include <stdint.h>
int main(){
    char a[8]="Hello";
    printf("%s\n",a);
    // s여서 전체를 출력 -> Hello
    printf("%s/n",a+1);
    // +1 한 후에 출력 -> ello
    a[3]=NULL;
    // NULL이 나와서 3번째 줄부터 잘림
    printf("%s\n",a+1);
    // 2번째부터 출력 잘린 부분이 있어 el만 출력함
    printf("%s\n",a+4);
    // 4번째에는 o밖에 없어서 o만 출력함
    return 0;
}