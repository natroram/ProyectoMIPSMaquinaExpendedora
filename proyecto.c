#include <stdio.h>
#include <stdlib.h>

char **a = {}; // NOMBRES
    int precios[] = {}; 
    int cantidad[] = {};
    int cantidadcopia[] = {};

int main(){   
    *char valor= "SI"
    while (valor == "SI"){
        menu(precios,a,cantidad,cantidadcopia);
        opcionuser= int(input("Ingrese el numero del producto: "))-1
        *char producto= a[opcionuser]
        int cantidnow= cantidadcopia[opcionuser]
        int precio = precios[opcionuser]
        if (cantidnow>0){
            total = monedas(arreglo)    
            if (total>=precio){
                printf("COMPRA EXITOSA");
                printf("SU VUELTO ES:    %d",total-precio);
                cantidadcopia[opcionuser]=cantidnow-1;
            }
            else{
                printf("FALLO AL MOMENTO DE REALIZAR LA COMPRA");
                printf("LA CANTIDAD DE DINERO INGRESADA ES INSUFICIENTE");
                printf("SU DINERO SERA DEVUELTO: %d",total);
            }
            
        }
        else {
            printf("ESTE PRODUCTO NO TIENE STOCK, ELIJA OTRO");
        }
        valor = input("DESEA COMPRAR OTRO PRODUCTO")

    }
    return 0;
}

dineroA = [0.01, 0.05, 0.1, 0.25, 0.5, 1 ,5, 10,20, 50, 100]

def monedas():
    valor= 1
    valor2=1
    total =0
    while (valor == valor2){
        //moneda=float(input("Ingrese una denominacion de dinero: "))
        //valor = contain(moneda)
        valorcontains = 1
        valorcontains2 = -1
        while (valorcontains != valorcontains2){
            moneda=float(input("Ingrese una denominacion de dinero valida: "))
            valorcontains2 = contain(moneda) # 1
        }
        cantidad = -1
        while (cantidad<=0){
            cantidad = int(input("Ingrese el numero de monedas/billetes que tiene: :) "))
        }
        # calculos
        total+=(cantidad*moneda)
        valor = input("Desea seguir ingresando monedas/billetes: ")
    }
    return total
    



// funciones

bool verificarStock(int copia,int cantidad){
    int valor = (copia*100)/cantidad
    return 10<valor<=15
}



int menu(int precios[],char **nombres[],int cantidad[],int copia[]){
    printf("--------------BIENVENIDOS---------------")
    printf("Elija alguna de las siguientes opciones");
    for (int i=0;i < sizeof(precios));i++ ){
        if verificarStock(copia[i],cantidad[i])
            printf(" %d %s %.2f-- %s",i++,nombres[i],precios[i],"Bajo Stock");
        else 
            printf(" %d %s %.2f",i++,nombres[i],precios[i]);

    }
    return 1;
}


a = []
int containts(int valor){
    int v= 0
    for(int i=0;i<):
        if (i == valor ) 
          v =1 
        else 
          v=-1
    return v
}