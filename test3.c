#include <stdint.h>
int fn(int n){
    if(n<=1)
     return 1;
    else
    return n*fn(n-1); 
}
int main(){
    printf("%d",fn(3));
    return 0;
}