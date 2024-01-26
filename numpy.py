import numpy as np
from typing import Tuple

#Crea un arreglo de NumPy llamado temperaturas que contenga las siguientes temperaturas en grados Celsius: 25, 30, 27, 22, 29, 31, 26, 28.
def ej_1_get_array() -> np.ndarray:
    temperaturas = np.array([25,30,27,22,29,31,26,28])
    return temperaturas

#Calcula la media y la desviación estándar de las temperaturas utilizando las funciones de agregación de NumPy. Almacena los resultados en variables llamadas media y desviacion.
def ej_2_media_std(array: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    media = np.mean(array)
    std = np.std(array)
    # : Retorna (media, std) en ese orden
    return media , std 
#Convierte las temperaturas de grados Celsius a grados Fahrenheit utilizando la fórmula F = C * 9/5 + 32, donde F representa los grados Fahrenheit y C representa los grados Celsius. Almacena los resultados en un nuevo arreglo NumPy llamado temperaturas_fahrenheit.

def ej_3_temperaturas(array: np.ndarray) -> np.ndarray:
    temperaturas_fahrenheit = array * 9/5 + 32
    return   temperaturas_fahrenheit

#Encuentra la temperatura máxima y mínima en el arreglo temperaturas_fahrenheit utilizando las funciones de agregación de NumPy. Almacena los resultados en variables llamadas temp_max y temp_min.
def ej_4_min_max(temperaturas_fahrenheit: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
  temp_min = np.min(temperaturas_fahrenheit)
  temp_max = np.max(temperaturas_fahrenheit)
  return temp_min , temp_max 

#Crea un arreglo NumPy llamado diferencias que contenga las diferencias entre cada temperatura en el arreglo temperaturas y la temperatura media calculada anteriormente.
def ej_5_diferencias(temperaturas: np.ndarray, media: float) -> np.ndarray:
    diferencias = temperaturas - media 
    return diferencias

#Calcula el cuadrado de cada diferencia en el arreglo diferencias utilizando la función de NumPy para operaciones matemáticas element-wise. Almacena los resultados en un nuevo arreglo NumPy llamado diferencias_cuadrado.
def ej_6_cuadrado(diferencias: np.ndarray) -> np.ndarray:
  diferencias_cuadrado = np.square(diferencias)
  return diferencias_cuadrado
#Calcula la suma de todos los elementos en el arreglo diferencias_cuadrado utilizando la función de agregación de NumPy. Almacena el resultado en una variable llamada suma_cuadrados.
def ej_7_suma(diferencias_cuadrado: np.ndarray) -> float:
  suma_cuadrados = np.sum(diferencias_cuadrado)
  return suma_cuadrados
#Calcula la raíz cuadrada de la suma de cuadrados utilizando la función de NumPy para operaciones matemáticas element-wise. Almacena el resultado en una variable llamada raiz_suma_cuadrados.
def ej_8_raiz(suma_cuadrados: float) -> float:
    raiz_suma_cuadrados =  np.sqrt(suma_cuadrados)
    return raiz_suma_cuadrados