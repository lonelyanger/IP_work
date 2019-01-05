#load.awk
BEGIN{
         recvLine=0;
         load=0;
         Normalized_load=0;
}
{
         if(($1=="r") && ($19=="AGT") && ($35=="cbr"))
         {
                   recvLine++;
         }
         if((($1=="s") || ($1=="f")) && ($19=="RTR") && (($35=="AODV")||($35=="message")))
         {
                   load++;
         }
}
END{
         Normalized_load=load/recvLine;
         printf("l:%d,nload:%.4f\n",load,Normalized_load);
}
