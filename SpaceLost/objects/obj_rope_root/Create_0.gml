tentacleno = 20; // 촉수 갯수
var i=0;
while(i<tentacleno){
    seg[i++] = instance_create(x,y,obj_rope_seg);
}
i=0;
while(i<tentacleno){
    seg[i].gap = 64; //촉수 사이 거리
    seg[i].root = id; //촉수의 뿌리
    if(i==0) seg[i].tail = id;
    else seg[i].tail = seg[max(0,i-1)]; //이전 촉수 부분 (없으면 objRoot)
    if(i==tentacleno-1) seg[i++].head = obj_player_ship;
    else seg[i++].head = seg[min(tentacleno-1,i+1)]; //다음 촉수 부분 (없으면 objPl)
}