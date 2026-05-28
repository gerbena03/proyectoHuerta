import time
import psutil
import os

process = psutil.Process(os.getpid())

def mostrar_memoria(momento):
    memoria = process.memory_info().rss / 1024 / 1024
    print(f"[{momento}] - MEMORIA: {memoria:.2f} MB")
    return memoria

print("="*60)
print("SIMULACION DE MEMORY LEAK - DOCKER")
print("Limite de memoria: 256 MB")
print("="*60)

datos_acumulados = []

for i in range(100):
    datos_acumulados.append("X" * 500000)
    
    memoria = mostrar_memoria(f"iteracion_{i}")
    
    if memoria > 250:
        print(f"ADVERTENCIA: Memoria cerca del limite! {memoria:.2f} MB")
    
    time.sleep(0.5)

print("="*60)
print("FIN DE LA SIMULACION")
print("="*60)
