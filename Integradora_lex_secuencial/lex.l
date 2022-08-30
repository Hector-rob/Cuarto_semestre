/*Hector Robles Villarreal A01634105*/
/*Lunes 30 de mayo de 2022*/
/*Actividad Integradora 5.3 Resaltador de sintaxis paralelo*/
/*Resaltador lexico secuencial de C++, Pyhton y Ruby*/
/*Para correrlo, en la terminal ingresar lo siguiente:*/
/* lex lex.l */
/* g++ -std=c++11 lex.yy.c*/
/* ./a.out */
/* Esto generara archivos html que se tienen que abrir en localhost */
/* En ese archivo se podrá ver el lexico resaltado de lo que tengan los archivos de entrada */

%{
#pragma GCC diagnostic ignored "-Wformat-security"//Para ignorar warnings en la consola, no afecta
#pragma GCC diagnostic ignored "-Wreturn-type" //Para ignorar warnings en la consola, no afecta
#pragma GCC diagnostic ignored "-Wdeprecated-register"  //Para ignorar warnings en la consola, no afecta
#pragma GCC diagnostic ignored "-Wwritable-strings"  //Para ignorar warnings en la consola, no afecta

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <time.h>  

extern int yylex();

void generateLex(char* name, char* reportName){
  FILE *entrada = fopen(name,"r");
  FILE *cssfile = fopen("estilos.css","w");
  yyout = cssfile;
  fprintf(yyout,".pr{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: yellow;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".ne{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: lightgreen;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".nd{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tcolor: white;\n");
  fprintf(yyout,"\tbackground-color: blue;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".var{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: lime;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".str{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: cyan;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".comment{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tcolor: white;\n");
  fprintf(yyout,"\tbackground-color: grey;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".op{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: pink;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".esc{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: lightblue;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".tipod{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tbackground-color: orange;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".varpunt{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tcolor: white;\n");
  fprintf(yyout,"\tbackground-color: brown;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".sp{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tcolor: white;\n");
  fprintf(yyout,"\tbackground-color: red;\n");
  fprintf(yyout, "}\n");
  fprintf(yyout,".lib{\n");
  fprintf(yyout,"\tdisplay: inline;\n");
  fprintf(yyout,"\twhite-space: pre;\n");
  fprintf(yyout,"\tcolor: white;\n");
  fprintf(yyout,"\tbackground-color: black;\n");
  fprintf(yyout, "}\n");
  FILE *htmlfile = fopen(reportName,"w");
  yyin = entrada;
  yyout = htmlfile;
  fprintf(yyout,"<!DOCTYPE html>\n");
  fprintf(yyout,"<html>\n");
  fprintf(yyout,"<head>\n");
  fprintf(yyout,"<link rel=\"stylesheet\" href=\"estilos.css\">\n");
  fprintf(yyout,"<title>Lex</title>\n");
  fprintf(yyout,"</head>\n");
  fprintf(yyout,"<body>\n");
  fprintf(yyout,"<h1>Lexer de C++, Python y Ruby</h1>\n");
  fprintf(yyout,"<h2>Hector Robles Villarreal A01634105 </h2>\n");
  fprintf(yyout,"<h2>Siginificado del color del marcatextos: </h2>\n");
  fprintf(yyout, "<h3 class =\"pr\">1.Palabras Reservadas</h3><br>\n");
  fprintf(yyout, "<h3 class =\"ne\">2.Enteros</h3><br>\n");
  fprintf(yyout, "<h3 class =\"nd\">3.Flotantes</h3><br>\n");
  fprintf(yyout, "<h3 class =\"var\">4.Identificadores/Variables</h3><br>\n");
  fprintf(yyout, "<h3 class =\"str\">5.Strings</h3><br>\n");
  fprintf(yyout, "<h3 class =\"comment\">6.Comentarios</h3><br>\n");
  fprintf(yyout, "<h3 class =\"op\">7.Operadores</h3><br>\n");
  fprintf(yyout, "<h3 class =\"esc\">8.Caracteres escape</h3><br>\n");
  fprintf(yyout, "<h3 class =\"tipod\">9.Tipos de dato</h3><br>\n");
  fprintf(yyout, "<h3 class =\"varpunt\">10.Punteros</h3><br>\n");
  fprintf(yyout, "<h3 class =\"sp\">11.Caracteres especiales</h3><br>\n");
  fprintf(yyout, "<h3 class =\"lib\">12.Inclusion de librerias o archivos</h3><br>\n");
  fprintf(yyout,"<h3>Entrada recibida de archivo:</h3><br>\n");
  while(yylex());
  if(*yytext == '\0'){
    fprintf(yyout, "\n");
  }
  fclose(entrada);
  fprintf(yyout,"\n</body>\n");
  fprintf(yyout,"</html>\n");
  fclose(htmlfile);
}

%}

%%

"\n" fprintf(yyout,"<br>\n");
\"(\\.|[^"\\])*\" { fprintf(yyout,"<h4 class=\"str\">") ; fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
\'(\\.|[^"\\])*\' { fprintf(yyout,"<h4 class=\"str\">") ; fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
[-+]?[0-9]+\.[0-9]+ {fprintf(yyout,"<h4 class=\"nd\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
[-+]?[0-9]+\.[0-9]+E.* {fprintf(yyout,"<h4 class=\"nd\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
[-+]?[0-9]+\.[0-9]+e.* {fprintf(yyout,"<h4 class=\"nd\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
[-+]?[0-9]+ {fprintf(yyout,"<h4 class=\"ne\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"#include".* {fprintf(yyout,"<h4 class=\"lib\">");fprintf(yyout,"#inclusion de libreria o archivo");fprintf(yyout,"</h4>\n");};
"import".* {fprintf(yyout,"<h4 class=\"lib\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"require".* {fprintf(yyout,"<h4 class=\"lib\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
int|string {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
char|bool {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
float|double {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
long|short {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
void|enum {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
null|auto {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
list {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
array {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
vector {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
map {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
pair {fprintf(yyout,"<h4 class=\"tipod\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
using {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
main {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
if|else {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
elif|const {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
for|while {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
each|unsigned {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
switch|do {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
iostream {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
fstream {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
return|break {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
continue {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
puts|max {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
gets|min {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
chomp {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
void|typedef {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
struct {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
goto|class {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
default {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
dllimport {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
false {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
new|novtable  {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
protected {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
sizeof {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
throw {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
typeid {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
volatile {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
case {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
delete|do {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
mutable {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
noinline {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
operator {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
uuid {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
public {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
selectany {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
static {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
template {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
true {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
typename {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
catch {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
deprecated {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
explicit {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
inline {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
naked {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
input {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
noreturn {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
register {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
this {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
try {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
union {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
virtual {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
dllexport {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
extern {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
private {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
friend {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
namespace {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
nothrow {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
property {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
join {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
signed {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
thread {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
False {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
None {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
True {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
and|as {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
assert {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
def|del {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
except {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
finally {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
from {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
global {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
in {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
is {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
lambda {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
nonlocal {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
not|or {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
pass {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
raise {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
with {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
yield {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
BEGIN {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
END {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
alias {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
begin {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
module {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
next {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
nil {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
redo {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
undo {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
rescue {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
retry {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
elsif {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
ensure {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
undef {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
unless {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
super|open {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
then|close {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
until|find {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
when|to {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
defined? {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
self {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
include {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
cout|cin {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
std|print  {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"else if" {fprintf(yyout,"<h4 class=\"pr\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"<h4 class=\"var\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
[a-zA-Z_][a-zA-Z0-9_*]* {fprintf(yyout,"<h4 class=\"varpunt\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"*"[a-zA-Z0-9_]* {fprintf(yyout,"<h4 class=\"varpunt\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"//".* {fprintf(yyout,"<h4 class=\"comment\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"#".*  {fprintf(yyout,"<h4 class=\"comment\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"/*"[^*/]*"*/" {fprintf(yyout,"<h4 class=\"comment\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"+"|"-"|"=" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"*"|"/" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"%" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"++"|"--" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"<"|">" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"<="|">=" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"==" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"!=" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"&&" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"||" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"!"|"&" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");}; 
".*" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"->" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"|"|"^" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
">>" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"<<" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"**" {fprintf(yyout,"<h4 class=\"op\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\a" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\b" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\f" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\n" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\r" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\t" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\v" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\ooo" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\\xhh" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"%r" {fprintf(yyout,"<h4 class=\"esc\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\;" {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\("|"\)" {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\["|"\]" {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\{"|"\}" {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\."|"\," {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
"\:" {fprintf(yyout,"<h4 class=\"sp\">");fprintf(yyout,yytext);fprintf(yyout,"</h4>\n");};
%%

int yywrap(void){}
int main()
{   
  double time_spent = 0.0;
  clock_t begin = clock();
  generateLex("input.txt", "report1.html");
  generateLex("input2.txt", "report2.html");
  generateLex("input3.txt", "report3.html");
  generateLex("input4.txt", "report4.html");
  generateLex("input5.txt", "report5.html");
  clock_t end = clock();
  time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
  printf("Lexer secuencial: ");
  printf("\n");
  printf("El tiempo de ejecucion en el programa secuencial es de %f segundos", time_spent);
  printf("\n");
  return 0;
}