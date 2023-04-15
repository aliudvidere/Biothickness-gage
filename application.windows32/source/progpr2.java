import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 
import controlP5.*; 
import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class progpr2 extends PApplet {

 //\u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u0443\u0435\u043c \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0443 Serial library
 //import ControlP5 library

ControlP5 cp5; //create ControlP5 object
PFont font;
PFont fontb;
Serial myPort; //\u043e\u0431\u044a\u0435\u043a\u0442 \u0442\u0438\u043f\u0430 Serial
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
String val="0"; // \u0442\u0430\u043a \u043a\u0430\u043a \u043c\u044b \u0440\u0435\u0430\u043b\u0438\u0437\u0443\u0435\u043c \u0440\u0443\u043a\u043e\u043f\u043e\u0436\u0430\u0442\u0438\u0435 \u043f\u043e \u0441\u0435\u0440\u0438\u0439\u043d\u043e\u043c\u0443 \u043f\u043e\u0440\u0442\u0443,
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
String mess="\u0422\u043e\u043b\u0449\u0438\u043d\u0430:";
String temp="0";
int schet=0;
int i;
int[] colv=new int[1000];
TableRow newRow;
// \u043d\u0430\u0434\u043e \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c, \u043f\u043e\u0441\u0442\u0443\u043f\u0430\u043b\u0438 \u043b\u0438 \u0434\u0430\u043d\u043d\u044b\u0435 \u043e\u0442 Arduino
Movie m;
boolean firstContact = false;
DropdownList d1;
Button uper;
Button downer;
long start_time;
public void setup() {
size(1200,800); //\u0441\u043e\u0437\u0434\u0430\u0435\u043c \u043e\u043a\u043d\u043e \u0441 \u0440\u0430\u0437\u043c\u0435\u0440\u0430\u043c\u0438 1200 x 800 \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439 
fon=loadImage("back.png");
fon1=loadImage("cos.png");
fon2=loadImage("back2.png");
fon.resize(1200,800);
fon1.resize(1200,800);
fon2.resize(1200,800);
background(fon);
text("\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430...", 460, 400);
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
// \u0438\u043d\u0438\u0446\u0438\u0430\u043b\u0438\u0437\u0438\u0440\u0443\u0435\u043c \u0441\u0435\u0440\u0438\u0439\u043d\u044b\u0439 \u043f\u043e\u0440\u0442 \u0438 \u0443\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u043c \u0441\u043a\u043e\u0440\u043e\u0441\u0442\u044c \u043f\u0435\u0440\u0435\u0434\u0430\u0447\u0438 \u0434\u0430\u043d\u043d\u044b\u0445 9600 baud
String[] port=Serial.list();
int portNum=port.length;
while(!firstContact&&portNum>-1)
  {
    portNum--;
    try
    {
      myPort = new Serial(this, Serial.list()[portNum], 115200);
      pause(1000);
    }catch(Exception e){if(portNum<port.length&&portNum>0) print(Serial.list()[portNum]+"-no\n");}
  }
if(!firstContact)
  while(true)
    background(fon);
myPort.bufferUntil('\n');
 cp5 = new ControlP5(this);
  font = createFont("Times New Roman", 100);    // custom fonts for buttons and title
  fontb = createFont("Times New Roman", 70);
  /*cp5.addButton("up")     //"red" is the name of button
    .setPosition(1000, 200)//x and y coordinates of upper left corner of button
    .setImages(aru)
    .updateSize()     //(width, height)
    .setFont(font)
  ;   

  cp5.addButton("down")     //"yellow" is the name of button
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
  ;*/
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

public void serialEvent( Serial myPort) { //\u0444\u043e\u0440\u043c\u0438\u0440\u0443\u0435\u043c \u0441\u0442\u0440\u043e\u043a\u0443 \u0438\u0437 \u0434\u0430\u043d\u043d\u044b\u0445, \u043a\u043e\u0442\u043e\u0440\u044b\u0435 \u043f\u043e\u0441\u0442\u0443\u043f\u0430\u044e\u0442

// '\n' - \u0440\u0430\u0437\u0434\u0435\u043b\u0438\u0442\u0435\u043b\u044c, \u043a\u043e\u0442\u043e\u0440\u044b\u0439 \u043a\u043e\u043d\u0435\u0446 \u043f\u0430\u043a\u0435\u0442\u0430 \u0434\u0430\u043d\u043d\u044b\u0445
vals=val;
val = myPort.readStringUntil('\n'); //\u0443\u0431\u0435\u0436\u0434\u0430\u0435\u043c\u0441\u044f, \u0447\u0442\u043e \u043d\u0430\u0448\u0438 \u0434\u0430\u043d\u043d\u044b\u0435 \u043d\u0435 \u043f\u0443\u0441\u0442\u044b\u0435 \u043f\u0435\u0440\u0435\u0434 \u0442\u0435\u043c, \u043a\u0430\u043a \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c
if (val != null) { //\u0443\u0434\u0430\u043b\u044f\u0435\u043c \u043f\u0440\u043e\u0431\u0435\u043b\u044b
val = trim(val);
println(val); //\u0438\u0449\u0435\u043c \u043d\u0430\u0448\u0443 \u0441\u0442\u0440\u043e\u043a\u0443 'A' , \u0447\u0442\u043e\u0431\u044b \u043d\u0430\u0447\u0430\u0442\u044c \u0440\u0443\u043a\u043e\u043f\u043e\u0436\u0430\u0442\u0438\u0435
//\u0435\u0441\u043b\u0438 \u043d\u0430\u0445\u043e\u0434\u0438\u043c, \u0442\u043e \u043e\u0447\u0438\u0449\u0430\u0435\u043c \u0431\u0443\u0444\u0435\u0440 \u0438 \u043e\u0442\u0441\u044b\u043b\u0430\u0435\u043c \u0437\u0430\u043f\u0440\u043e\u0441 \u043d\u0430 \u0434\u0430\u043d\u043d\u044b\u0435

if (firstContact == false) {

if (val.equals("A")) {

myPort.clear();

firstContact = true;

myPort.write("A");

val="0.0000";
println("contact");

}

}

else {//\u0435\u0441\u043b\u0438 \u043a\u043e\u043d\u0442\u0430\u043a\u0442 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d, \u043f\u043e\u043b\u0443\u0447\u0430\u0435\u043c \u0438 \u043f\u0430\u0440\u0441\u0438\u043c \u0434\u0430\u043d\u043d\u044b\u0435
flag=true;
/*if (val.equals("up"))
{
  fl=true;
  println("up");
}
if (val.equals("down"))
{
  fl=false;
  println("down");
}*/
//\u0442\u0430\u043a \u043a\u0430\u043a \u0432\u0441\u0435 \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u044b\u0435 \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438 \u043f\u0440\u043e\u0438\u0437\u0432\u043e\u0434\u044f\u0442\u0441\u044f \u0432 \u043f\u0440\u0435\u0434\u0435\u043b\u0430\u0445 serialEvent (\u0441\u043c\u043e\u0442\u0440\u0438\u0442\u0435 \u043d\u0438\u0436\u0435)

/*if (mousePressed == true) { //\u0435\u0441\u043b\u0438 \u043c\u044b \u043a\u043b\u0438\u043a\u043d\u0443\u043b\u0438 \u043c\u044b\u0448\u043a\u043e\u0439 \u043f\u043e \u043e\u043a\u043d\u0443

myPort.write('1'); //\u043e\u0442\u0441\u044b\u043b\u0430\u0435\u043c 1

println("1"); } // \u043a\u043e\u0433\u0434\u0430 \u0432\u044b \u0432\u0441\u0435 \u0434\u0430\u043d\u043d\u044b\u0435, \u0434\u0435\u043b\u0430\u0435\u043c \u0437\u0430\u043f\u0440\u043e\u0441 \u043d\u0430 \u043d\u043e\u0432\u044b\u0439 \u043f\u0430\u043a\u0435\u0442*/

myPort.write("A"); } } }
public void draw() {
if(fl2)
  {
    while(m.available()&&fl2)
      m.read();
    if(fl2)
    background(m);
    if(m.time()==m.duration()&&fl2)
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
      /*d1 = cp5.addDropdownList("myList-d1")
                        .setPosition(100, 100)
                        .setSize(200,200)
                        ;
                        customize(d1);*/
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
      if(f==0)
      {
        background(fon);
        fill(0);
      }
      if(f==1)
      {
        background(fon1);
        fill(255);
      }             //text color (r, g, b)
      if(f==2)
      {
        background(fon2);
        fill(255);
      }
      textFont(font);
      mess="\u0422\u043e\u043b\u0449\u0438\u043d\u0430:";
      text(mess,400,300);
      if(val.charAt(val.length()-1)=='_'&&!flu)
        text(vals, 460, 400);
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
          //val.replace('_',');
          //text(val, 460, 400);
          /*newRow = table.addRow();
          newRow.setString("Weidth", vals);
          savetable(table, "data/new.csv");*/
          //if(flu)
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
      //vals=val;
      //temp=vals;
     /*if(flag==true&&val!=null)
      {
       // if(val!=null)
          //data_izm.println("izm");  
          //lines[schet]=val;
         /* if(schet>=2000000)
          {
             schet=0;
             lines = null;
          }*/
          //lines = loadStrings(mess);
          
         /* textLines = loadStrings(mess);
          for(int i=j;i<textLines.length;i++)
            if(textLines[i].equals("izm"))
            {
              j=i+1;
              println(textLines[i]); 
            }
          newRow = table.addRow();
          newRow.setString("Weidth", val);
          println('['+val+']');
         itog = new Table();
          itog.addColumn("Weidth");
          for(i=schet;i<table.getRowCount()-1;i++)
            if(table.getFloat(i,0)==table.getFloat(i+1,0))
              {
                newRow = itog.addRow();
                newRow.setFloat("Weidth",table.getFloat(i,0));
                //println(table.getFloat(i,0));
              }
          saveTable(itog, "data/new.csv");
          schet=table.getRowCount()-1;
          flag=false;
      }*/
      //data_izm.flush(); 
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
public void up(){
  //if(!flu)
  //if(dv)
  {
    if(fll)
    {
      jj++;
      if(jj>ii)
        jj=1;
      println(jj);
      val="\u041e\u0431\u0440\u0430\u0437\u0446#"+str(jj);
    }
    else if(!fll&&dv)
    {
      myPort.write('u');
      myPort.write('0');
    }
  }
}

public void down(){
  //if(!flu)
  //if(dv)
  {
    if(fll)
    {
      jj--;
      if(jj==0)
        jj=ii;
      println(jj);
      val="\u041e\u0431\u0440\u0430\u0437\u0446#"+str(jj);
    }
    else if(!fll&&dv)
    {
      myPort.write('d');
      myPort.write('0');
    }
  }
}

public void reset(){
  //mess="\u041f\u043e\u0434\u043e\u0436\u0434\u0438\u0442\u0435!";
  myPort.write('r');
  myPort.write('0');
  fll=false;
}
public void colibr(){
  //mess="\u041f\u043e\u0434\u043e\u0436\u0434\u0438\u0442\u0435!";
  myPort.write('c');
  myPort.write('0');
  fll=false;
}
public void foni(){
  //int f=0;
      /*if(f==0)
        background(fon);
      if(f==1)
        background(fon1);*/
      f++;
      if(f>2)
        f=0;
}
public void sta(){
  mess="\u0422\u043e\u043b\u0449\u0438\u043d\u0430:";
  myPort.write('i');
  myPort.write('0');
  flu=true;
  fll=false;
}
public void stp(){
  mess="\u041e\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0430:";
  myPort.write('s');
  myPort.write('s'); 
  myPort.write('0');
  flag=false;
  flu=false;
  fll=false;
}
public void savetable(Table table, String fil){
    saveTable(table, fil);
    lines=loadStrings(fil);
    for(int m=0;m<lines.length;m++)
    {
     lines[m]=lines[m].replace(',',';');
     println(lines[m]);
    }
    saveStrings(fil,lines);
}
public void new_column()
{
    ii++;
    jj=ii;
    colv[jj]=0;
    table.addColumn(" Obraz#"+ii);
    table.setString(0," Obraz#"+ii,"________");
    savetable(table,"data/new.csv");
}
public void vibor()
{
   fll=!fll; 
}
public void pause(int tim)
{
 long T=millis();
 while(millis()-T<tim);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "progpr2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
