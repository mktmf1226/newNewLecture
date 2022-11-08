/* myscript. js*/

function hap(a, b){  //두 수 사이의 합을 반환하시오
                     //2+3+4+5
                     //5+4+3+2
    if(a>b){//swap하는 과정
        let tmp=a;
        a=b;
        b=tmp;
    }//if end

    let sum=0;
    for(n=a; n<=b; n++){
        sum+=n;
    }//for end

    return sum;                
}//hap() end


function diff(a, b){ //두 수 사이의 차이를 반환하시오
                     //2, 5 ->3
                     //5, 2 ->3
                     //양수값 반환
    return Math.abs(a-b);//절대값
}//diff() end


function leap(year){ //윤년, 평년을 반환하시오
    if(year%4==0 && year%100!=0 || year%400==0){
        return true;
    }else{
        return false;
    }//if end
}//leap() end


