clc; clear; close all;
pkg load image;
pkg load signal;

A = imread('imagen1.jpg');
A = double(A);
B = comprimir_jpeg(A);

Ar = descomprimir_jpeg(B);
Ar = uint8(Ar);
