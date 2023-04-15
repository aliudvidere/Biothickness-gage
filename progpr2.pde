import processing.serial.*; //импортируем библиотеку Serial library
import controlP5.*; //import ControlP5 library
import processing.video.*;
ControlP5 cp5; //create ControlP5 object
PFont font;
PFont fontb;
Serial myPort; //объект типа Serial
PrintWriter data_izm;
PrintWriter data_rez;
boolean fl=true;
boolean fl1=true;
boolean fl2=true;
boolean flag=false;
boolean flu=true;
boolean fll;
boolean dv;
boolean vndu;
boolean vndu2;
boolean vndu3;
boolean vndd;
boolean vndd2;
boolean vndd3;
boolean flagMGTU = false;
String val="0.0000"; // так как мы реализуем рукопожатие по серийному порту,
String vals;
PImage fon;
PImage aru;
PImage ard;
PImage res;
PImage col;
PImage st;
PImage stpp;
PImage fonn;
PImage fon1;
PImage fon2;
PImage fon3;
PImage n_sam;
PImage sam;
int raz=150;
int f=0;
int j=0;
int k;
int ii=0;
int jj=0;
float dan;
Table table;
Table itog;
String[] lines;
String mess="Толщина:";
String temp="0";
int schet=0;
int i;
int[] colv=new int[1000];
TableRow newRow;
// надо проверить, поступали ли данные от Arduino
Movie m;
boolean firstContact = false;
DropdownList d1;
Button uper;
Button downer;
boolean mgtuCh = false;
long start_time;
void setup() {
size(1200,800); //создаем окно с размерами 1200 x 800 пикселей 
fon=loadImage("back.png");
fon1=loadImage("cos.png");
fon2=loadImage("back2.png");
fon3 = loadImage("fonmgtu.png");
fon.resize(1200,800);
fon1.resize(1200,800);
fon2.resize(1200,800);
fon2.resize(1200,800);
background(fon);
text("Загрузка...", 460, 400);
m = new Movie( this, "egu.mov" );
m.play();
table = new Table();
table.addColumn("Weidth");
itog = new Table();
itog.addColumn("Weidth");
 // customize the first list
/*PImage[] aru={loadImage("arrow1(up).png"),loadImage("arrow2(up).png"),loadImage("arrow3(up).png")};
PImage[] ard={loadImage("arrow1(down).png"),loadImage("arrow2(down).png"),loadImage("arrow3(down).png")};
PImage[] res={loadImage("res1.png"),loadImage("res2.png"),loadImage("res3.png")};
PImage[] col={loadImage("col1.png"),loadImage("col2.png"),loadImage("col3.png")};
aru[0].resize(raz,raz);
aru[1].resize(raz,raz);
aru[2].resize(raz,raz);

ard[0].resize(raz,raz);
ard[1].resize(raz,raz);
ard[2].resize(raz,raz);

res[0].resize(raz,raz);
res[1].resize(raz,raz);
res[2].resize(raz,raz);

col[0].resize(raz,raz);
col[1].resize(raz,raz);
col[2].resize(raz,raz);*/
// инициализируем серийный порт и устанавливаем скорость передачи данных 9600 baud
String[] port=Serial.list();
/*for(String s : port)
{
  println(s);
  try{
    myPort = new Serial(this, s, 115200);
    if(firstContact){
      println("Заебись");
      break;
    }
  }
  catch(Exception e){
    continue;
  }
 
}*/

 cp5 = new ControlP5(this);
  font = createFont("SF Pro Display", 100);    // custom fonts for buttons and title
  fontb = createFont("Times New Roman", 70);
  table = new Table();
  ii++;
  jj=ii;
  table.addColumn("|||||||||");
  table.addColumn(" Obraz#"+ii);
  table.setString(0," Obraz#"+ii,"________");
  table.setString(0,0,"________");
  colv[ii]=0;
  savetable(table,"data/new.csv");
}

void serialEvent( Serial myPort) { //формируем строку из данных, которые поступают

// '\n' - разделитель, который конец пакета данных
vals=val;
val = myPort.readStringUntil('\n'); //убеждаемся, что наши данные не пустые перед тем, как продолжить
if (val != null) { //удаляем пробелы
val = trim(val);
println(val); //ищем нашу строку 'A' , чтобы начать рукопожатие
//если находим, то очищаем буфер и отсылаем запрос на данные

if (firstContact == false) {

if (val.equals("A")) {

myPort.clear();

firstContact = true;

myPort.write("A");

val="0.0000";
println("contact");

}

}

else {//если контакт установлен, получаем и парсим данные
flag=true;
myPort.write("A"); } } }
void draw() {
if(fl2)
  {
    if(fl2)//if(m.time()==m.duration()&&fl2)
    {
      fl2=!fl2;
      background(fon);
      PImage[] aru={loadImage("arrow1(up).png"),loadImage("arrow2(up).png"),loadImage("arrow3(up).png")};
      PImage[] ard={loadImage("arrow1(down).png"),loadImage("arrow2(down).png"),loadImage("arrow3(down).png")};
      PImage[] res={loadImage("res1.png"),loadImage("res2.png"),loadImage("res3.png")};
      PImage[] col={loadImage("col1.png"),loadImage("col2.png"),loadImage("col3.png")};
      PImage[] fonn={loadImage("but1.png"),loadImage("but2.png"),loadImage("but3.png")};
      PImage[] st={loadImage("st1.png"),loadImage("st2.png"),loadImage("st3.png")};
      PImage[] stpp={loadImage("stop1.png"),loadImage("stop2.png"),loadImage("stop3.png")};
      PImage[] n_sam={loadImage("sample1.png"),loadImage("sample2.png"),loadImage("sample3.png")};
      PImage[] sam={loadImage("samples1.png"),loadImage("samples2.png"),loadImage("samples3.png")};
      PImage[] bamon={loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png")};
      aru[0].resize(raz,raz);
      aru[1].resize(raz,raz);
      aru[2].resize(raz,raz);
      
      ard[0].resize(raz,raz);
      ard[1].resize(raz,raz);
      ard[2].resize(raz,raz);
      
      res[0].resize(raz,raz);
      res[1].resize(raz,raz);
      res[2].resize(raz,raz);
      
      col[0].resize(raz,raz);
      col[1].resize(raz,raz);
      col[2].resize(raz,raz);
   
      fonn[0].resize(raz/4,raz/4);
      fonn[1].resize(raz/4,raz/4);
      fonn[2].resize(raz/4,raz/4);
      
      st[0].resize(2*raz,raz);
      st[1].resize(2*raz,raz);
      st[2].resize(2*raz,raz);
      
      stpp[0].resize(raz,raz);
      stpp[1].resize(raz,raz);
      stpp[2].resize(raz,raz);
      
      n_sam[0].resize(2*raz,3*raz/5);
      n_sam[1].resize(2*raz,3*raz/5);
      n_sam[2].resize(2*raz,3*raz/5);
      
      sam[0].resize(2*raz,3*raz/5);
      sam[1].resize(2*raz,3*raz/5);
      sam[2].resize(2*raz,3*raz/5);
      
      bamon[0].resize(raz/5,raz/5);
      bamon[1].resize(raz/5,raz/5);
      bamon[2].resize(raz/5,raz/5);
      
   uper=cp5.addButton("up")     //"red" is the name of button
    .setPosition(1000, 200)//x and y coordinates of upper left corner of button
    .setImages(aru)
    .updateSize()     //(width, height)
    .setFont(font)
  ;   

  downer=cp5.addButton("down")     //"yellow" is the name of button
    .setPosition(1000, 400)  //x and y coordinates of upper left corner of button
    .setImages(ard)
    .updateSize()      //(width, height)
    .setFont(font)
  ;
  cp5.addButton("reset")     //"yellow" is the name of button
    .setPosition(100, 200)  //x and y coordinates of upper left corner of button
    .setImages(res)
    .updateSize() 
    .setFont(font)
  ;
  cp5.addButton("colibr")     //"yellow" is the name of button
    .setPosition(100, 400)
    .setImages(col)
    .updateSize() 
    .setFont(fontb)
  ;
  cp5.addButton("foni")     //"yellow" is the name of button
    .setPosition(0,0)
    .setImages(fonn)
    .updateSize() 
    .setFont(fontb)
  ;
  cp5.addButton("sta")     //"yellow" is the name of button
    .setPosition(450,500)
    .setImages(st)
    .updateSize() 
    .setFont(fontb)
  ;
  cp5.addButton("stp")     //"yellow" is the name of button
    .setPosition(525,650)
    .setImages(stpp)
    .updateSize() 
    .setFont(fontb)
    ;
  cp5.addButton("new_column")     //"new_column" is the name of button
    .setPosition(700, 0)
    .setImages(n_sam)
    .updateSize() 
    .setFont(fontb)
    ;
  cp5.addButton("vibor")     //"new_column" is the name of button
    .setPosition(200, 0)
    .setImages(sam)
    .updateSize() 
    .setFont(fontb)
    ;
  cp5.addButton("mgtu")     //"new_column" is the name of button
    .setPosition(1170, 770)
    .setImages(bamon)
    .updateSize() 
    .setFont(fontb)
    ;
  /*cp5.addButton("tof")     //"yellow" is the name of button
    .setPosition(1150,750)
    .setSize(20,20) 
    .setFont(fontb)
    ;*/
    }
  }
  if(!fl2)
  {
   dv=true;
   if(!uper.isPressed())
     vndu=true;
   if(!downer.isPressed())
     vndd=true;
   if(uper.isPressed()&&!downer.isPressed()&&!fll)
   {    
     delay(200);
     dv=false;
     if(vndu)
       start_time=millis();
     vndu=false;
     if(millis()-start_time<2000)
     {
       myPort.write('u');
       myPort.write('0');
     }
     else
     {
       myPort.write('u');
       myPort.write('0');
     }
   }
   if(!uper.isPressed()&&downer.isPressed()&&!fll)
   {
     delay(200);
     dv=false;
     if(vndd)
       start_time=millis();
     vndd=false;
     if(millis()-start_time<2000)
     {
       myPort.write('d');
       myPort.write('0');
     }
     else
     {
       myPort.write('d');
       myPort.write('0');
     }
   }
   if(val!=null)
    {
      if(flagMGTU)
      {
        background(fon3);
        fill(35,50,135);
        if(mgtuCh)
        {
          mgtuCh = false;
          PImage[] aru={loadImage("arrow1(up)mgtu.png"),loadImage("arrow2(up)mgtu.png"),loadImage("arrow3(up)mgtu.png")};
          PImage[] ard={loadImage("arrow1(down)mgtu.png"),loadImage("arrow2(down)mgtu.png"),loadImage("arrow3(down)mgtu.png")};
          PImage[] res={loadImage("res1mgtu.png"),loadImage("res2mgtu.png"),loadImage("res3mgtu.png")};
          PImage[] col={loadImage("col1mgtu.png"),loadImage("col2mgtu.png"),loadImage("col3mgtu.png")};
          PImage[] fonn={loadImage("but1mgtu.png"),loadImage("but2mgtu.png"),loadImage("but3mgtu.png")};
          PImage[] st={loadImage("st1mgtu.png"),loadImage("st2mgtu.png"),loadImage("st3mgtu.png")};
          PImage[] stpp={loadImage("stop1mgtu.png"),loadImage("stop2mgtu.png"),loadImage("stop3mgtu.png")};
          PImage[] n_sam={loadImage("sample1mgtu.png"),loadImage("sample2mgtu.png"),loadImage("sample3mgtu.png")};
          PImage[] sam={loadImage("samples1mgtu.png"),loadImage("samples2mgtu.png"),loadImage("samples3mgtu.png")};
          PImage[] bamon={loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png")};
          
          aru[0].resize(raz,raz);
          aru[1].resize(raz,raz);
          aru[2].resize(raz,raz);
          
          ard[0].resize(raz,raz);
          ard[1].resize(raz,raz);
          ard[2].resize(raz,raz);
          
          res[0].resize(raz,raz);
          res[1].resize(raz,raz);
          res[2].resize(raz,raz);
          
          col[0].resize(raz,raz);
          col[1].resize(raz,raz);
          col[2].resize(raz,raz);
       
          fonn[0].resize(raz/4,raz/4);
          fonn[1].resize(raz/4,raz/4);
          fonn[2].resize(raz/4,raz/4);
          
          st[0].resize(2*raz,raz);
          st[1].resize(2*raz,raz);
          st[2].resize(2*raz,raz);
          
          stpp[0].resize(raz,raz);
          stpp[1].resize(raz,raz);
          stpp[2].resize(raz,raz);
          
          n_sam[0].resize(2*raz,3*raz/5);
          n_sam[1].resize(2*raz,3*raz/5);
          n_sam[2].resize(2*raz,3*raz/5);
          
          sam[0].resize(2*raz,3*raz/5);
          sam[1].resize(2*raz,3*raz/5);
          sam[2].resize(2*raz,3*raz/5);
          
          bamon[0].resize(raz/5,raz/5);
          bamon[1].resize(raz/5,raz/5);
          bamon[2].resize(raz/5,raz/5);
          
             uper=cp5.addButton("up")     //"red" is the name of button
                .setPosition(1000, 200)//x and y coordinates of upper left corner of button
                .setImages(aru)
                .updateSize()     //(width, height)
                .setFont(font)
              ;   
            
              downer=cp5.addButton("down")     //"yellow" is the name of button
                .setPosition(1000, 400)  //x and y coordinates of upper left corner of button
                .setImages(ard)
                .updateSize()      //(width, height)
                .setFont(font)
              ;
              cp5.addButton("reset")     //"yellow" is the name of button
                .setPosition(100, 200)  //x and y coordinates of upper left corner of button
                .setImages(res)
                .updateSize() 
                .setFont(font)
              ;
              cp5.addButton("colibr")     //"yellow" is the name of button
                .setPosition(100, 400)
                .setImages(col)
                .updateSize() 
                .setFont(fontb)
              ;
              cp5.addButton("foni")     //"yellow" is the name of button
                .setPosition(0,0)
                .setImages(fonn)
                .updateSize() 
                .setFont(fontb)
              ;
              cp5.addButton("sta")     //"yellow" is the name of button
                .setPosition(450,500)
                .setImages(st)
                .updateSize() 
                .setFont(fontb)
              ;
              cp5.addButton("stp")     //"yellow" is the name of button
                .setPosition(525,650)
                .setImages(stpp)
                .updateSize() 
                .setFont(fontb)
                ;
              cp5.addButton("new_column")     //"new_column" is the name of button
                .setPosition(700, 0)
                .setImages(n_sam)
                .updateSize() 
                .setFont(fontb)
                ;
              cp5.addButton("vibor")     //"new_column" is the name of button
                .setPosition(200, 0)
                .setImages(sam)
                .updateSize() 
                .setFont(fontb)
                ;
                      ////////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
        }    
  ;  
      }
      //yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
      if(!flagMGTU&&!mgtuCh){
        mgtuCh = true;
        PImage[] aru={loadImage("arrow1(up).png"),loadImage("arrow2(up).png"),loadImage("arrow3(up).png")};
        PImage[] ard={loadImage("arrow1(down).png"),loadImage("arrow2(down).png"),loadImage("arrow3(down).png")};
        PImage[] res={loadImage("res1.png"),loadImage("res2.png"),loadImage("res3.png")};
        PImage[] col={loadImage("col1.png"),loadImage("col2.png"),loadImage("col3.png")};
        PImage[] fonn={loadImage("but1.png"),loadImage("but2.png"),loadImage("but3.png")};
        PImage[] st={loadImage("st1.png"),loadImage("st2.png"),loadImage("st3.png")};
        PImage[] stpp={loadImage("stop1.png"),loadImage("stop2.png"),loadImage("stop3.png")};
        PImage[] n_sam={loadImage("sample1.png"),loadImage("sample2.png"),loadImage("sample3.png")};
        PImage[] sam={loadImage("samples1.png"),loadImage("samples2.png"),loadImage("samples3.png")};
        PImage[] bamon={loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png"),loadImage("Gerb_MGTU.png")};
        aru[0].resize(raz,raz);
        aru[1].resize(raz,raz);
        aru[2].resize(raz,raz);
        
        ard[0].resize(raz,raz);
        ard[1].resize(raz,raz);
        ard[2].resize(raz,raz);
        
        res[0].resize(raz,raz);
        res[1].resize(raz,raz);
        res[2].resize(raz,raz);
        
        col[0].resize(raz,raz);
        col[1].resize(raz,raz);
        col[2].resize(raz,raz);
     
        fonn[0].resize(raz/4,raz/4);
        fonn[1].resize(raz/4,raz/4);
        fonn[2].resize(raz/4,raz/4);
        
        st[0].resize(2*raz,raz);
        st[1].resize(2*raz,raz);
        st[2].resize(2*raz,raz);
        
        stpp[0].resize(raz,raz);
        stpp[1].resize(raz,raz);
        stpp[2].resize(raz,raz);
        
        n_sam[0].resize(2*raz,3*raz/5);
        n_sam[1].resize(2*raz,3*raz/5);
        n_sam[2].resize(2*raz,3*raz/5);
        
        sam[0].resize(2*raz,3*raz/5);
        sam[1].resize(2*raz,3*raz/5);
        sam[2].resize(2*raz,3*raz/5);
        
        bamon[0].resize(raz/5,raz/5);
        bamon[1].resize(raz/5,raz/5);
        bamon[2].resize(raz/5,raz/5);
        
          uper=cp5.addButton("up")     //"red" is the name of button
                  .setPosition(1000, 200)//x and y coordinates of upper left corner of button
                  .setImages(aru)
                  .updateSize()     //(width, height)
                  .setFont(font)
                ;   
              
                downer=cp5.addButton("down")     //"yellow" is the name of button
                  .setPosition(1000, 400)  //x and y coordinates of upper left corner of button
                  .setImages(ard)
                  .updateSize()      //(width, height)
                  .setFont(font)
                ;
                cp5.addButton("reset")     //"yellow" is the name of button
                  .setPosition(100, 200)  //x and y coordinates of upper left corner of button
                  .setImages(res)
                  .updateSize() 
                  .setFont(font)
                ;
                cp5.addButton("colibr")     //"yellow" is the name of button
                  .setPosition(100, 400)
                  .setImages(col)
                  .updateSize() 
                  .setFont(fontb)
                ;
                cp5.addButton("foni")     //"yellow" is the name of button
                  .setPosition(0,0)
                  .setImages(fonn)
                  .updateSize() 
                  .setFont(fontb)
                ;
                cp5.addButton("sta")     //"yellow" is the name of button
                  .setPosition(450,500)
                  .setImages(st)
                  .updateSize() 
                  .setFont(fontb)
                ;
                cp5.addButton("stp")     //"yellow" is the name of button
                  .setPosition(525,650)
                  .setImages(stpp)
                  .updateSize() 
                  .setFont(fontb)
                  ;
                cp5.addButton("new_column")     //"new_column" is the name of button
                  .setPosition(700, 0)
                  .setImages(n_sam)
                  .updateSize() 
                  .setFont(fontb)
                  ;
                cp5.addButton("vibor")     //"new_column" is the name of button
                  .setPosition(200, 0)
                  .setImages(sam)
                  .updateSize() 
                  .setFont(fontb)
                  ;
                  }
      //yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
      if(f==0&&!flagMGTU)
      {
        background(fon);
        fill(0);
      }
      if(f==1&&!flagMGTU)
      {
        background(fon1);
        fill(255);
      }             //text color (r, g, b)
      if(f==2&&!flagMGTU)
      {
        background(fon2);
        fill(255);
      }
      if(f==3&&!flagMGTU)
      {
        background(fon3);
        fill(35,50,135);
      }
      textFont(font);
      mess="Толщина:";
      text(mess,400,300);
      if(!(val == null))
      {
      if(val.charAt(val.length()-1)=='_'&&!flu)
        text(val, 460, 400);
      if(val.charAt(val.length()-1)=='_'&&flu)
        text(temp, 460, 400);
      if(val.charAt(val.length()-1)!='_')
        if(val.substring(0,5).equals("Start"))
        {
          textFont(fontb);
          text(val, 320, 400);
        }
        else
          text(val, 460, 400);
      else
      {
      if(val.charAt(val.length()-1)=='_'&&flag&&flu)
      {
          {
            colv[jj]++;
            if(colv[jj]>max(colv))
            {
              TableRow newRow = table.addRow();
              newRow.setString("", "Weidth"); 
              newRow.setString(" Obraz#"+jj, vals);
            }
            else
            {
               table.setString(colv[jj]," Obraz#"+jj,vals);
               //izmer++;
            }
            for(int l=1;l<max(colv)+1;l++)
              table.setString(l,0,"Measur#"+l);
            savetable(table,"data/new.csv");
          }
          temp=vals;
          flag=false;
          flu=true;
      }
    }
      } 
      while(fl1)
      {
        background(fon);
        fill(0);               //text color (r, g, b)
        textFont(font);
        text(mess,400,300);
        text("0.0000", 460, 400);
        fl1=false; 
      }
    }
  }
}
void up(){
  //if(!flu)
  //if(dv)
  {
    if(fll)
    {
      jj++;
      if(jj>ii)
        jj=1;
      println(jj);
      val="Образц#"+str(jj);
    }
    else if(!fll&&dv)
    {
      myPort.write('u');
      myPort.write('0');
    }
  }
}

void down(){
  {
    if(fll)
    {
      jj--;
      if(jj==0)
        jj=ii;
      println(jj);
      val="Образц#"+str(jj);
    }
    else if(!fll&&dv)
    {
      myPort.write('d');
      myPort.write('0');
    }
  }
}
void reset(){
  myPort.write('r');
  myPort.write('0');
  fll=false;
}
void colibr(){
  myPort.write('c');
  myPort.write('0');
  fll=false;
}
void foni(){
      f++;
      if(f>3)
        f=0;
}
void sta(){
  mess="Толщина:";
  myPort.write('i');
  myPort.write('0');
  flu=true;
  fll=false;
}
void stp(){
  mess="Остановка:";
  myPort.write('s');
  myPort.write('s'); 
  myPort.write('0');
  flag=false;
  flu=false;
  fll=false;
}
void savetable(Table table, String fil){
    saveTable(table, fil);
    lines=loadStrings(fil);
    for(int m=0;m<lines.length;m++)
    {
     lines[m]=lines[m].replace(',',';');
     println(lines[m]);
    }
    saveStrings(fil,lines);
}
void new_column()
{
    ii++;
    jj=ii;
    colv[jj]=0;
    table.addColumn(" Obraz#"+ii);
    table.setString(0," Obraz#"+ii,"________");
    savetable(table,"data/new.csv");
}
void vibor()
{
   fll=!fll; 
}
void pause(int tim)
{
 long T=millis();
 while(millis()-T<tim);
}
void mgtu(){
  flagMGTU = !flagMGTU;
  if(flagMGTU)
    mgtuCh = true;
}
