// =====================================================
// EXERCÍCIOS C — ALGORITMOS
// =====================================================

// -------------------------------------------------------
// AULA 01 — VARIÁVEIS E OPERAÇÕES BÁSICAS
// -------------------------------------------------------

// Exercício 1 — Conversão km para metro
#include <stdio.h>
int main() {
    float km, metro;
    printf("Digite a distancia em km:");
    scanf("%f", &km);
    metro = km * 1000;
    printf("%.2f km equivalem a %.2f metro.\n", km, metro);
    return 0;
}

// Exercício 2 — Salário com aumento percentual
#include <stdio.h>
int main() {
    double salario, aumento, novo;
    printf("Digite seu salário:\n");
    scanf("%lf", &salario);
    printf("Quanto foi o aumento?\n");
    scanf("%lf", &aumento);
    novo = salario + (salario * aumento / 100);
    printf("%.2f era o salario anterior, agora é %.2f", salario, novo);
}

// Exercício 3 — Celsius para Fahrenheit
#include <stdio.h>
int main() {
    double c, f;
    printf("Como ta a temperatura?\n");
    scanf("%lf", &c);
    f = (c * 9/5) + 32;
    printf("A temperatura %.2lf celcius, em fahrenheit é %.2lf", c, f);
    return 0;
}

// Exercício 4 — Troca de variáveis
#include <stdio.h>
int main() {
    double n1, n2, sub;
    printf("Fale um número:\n");
    scanf("%lf", &n1);
    printf("Fale outro número:\n");
    scanf("%lf", &n2);
    sub = n1;
    n1 = n2;
    n2 = sub;
    printf("seu primeiro numero é %.0lf, e o segundo %.0lf", n1, n2);
}

// Exercício 5 — Valor por hora trabalhada
#include <stdio.h>
int main() {
    double horat, salario, valort;
    printf("Quantas horas voce trabalha na semana?\n");
    scanf("%lf", &horat);
    printf("Qual seu salário:\n");
    scanf("%lf", &salario);
    valort = salario / (horat * 5);
    printf("Seu valor por hora é %.2lf", valort);
    return 0;
}

// -------------------------------------------------------
// AULA 02 — GEOMETRIA E MATEMÁTICA
// -------------------------------------------------------

// Exercício 11 — Perímetro do retângulo
#include <stdio.h>
int main() {
    double ba, al, pe;
    printf("Informe a base:\n");
    scanf("%lf", &ba);
    printf("Informe a altura:\n");
    scanf("%lf", &al);
    pe = 2 * (ba + al);
    printf("O perimetro é %.2lf:", pe);
}

// Exercício 12 — Volume do paralelepípedo
#include <stdio.h>
int main() {
    double c, a, l, v;
    printf("Informe o comprimento:\n");
    scanf("%lf", &c);
    printf("Informe a altura:\n");
    scanf("%lf", &a);
    printf("Informe a largura:\n");
    scanf("%lf", &l);
    v = c * a * l;
    printf("O volume é %.2lf:", v);
}

// Exercício 13 — Desconto em produto
#include <stdio.h>
int main() {
    double v, vf, d;
    printf("Informe o valor do produto:\n");
    scanf("%lf", &v);
    printf("Informe o desconto:\n");
    scanf("%lf", &d);
    vf = v - (v * (d / 100));
    printf("O valor com desconto é %.2lf:", vf);
}

// Exercício 15 — Valor unitário
#include <stdio.h>
int main() {
    double qntd, valor, vlunico;
    printf("Fale a quantidade de um produto:\n");
    scanf("%lf", &qntd);
    printf("Valor total:\n");
    scanf("%lf", &valor);
    vlunico = valor / qntd;
    printf("O valor unico é: %.2lf", vlunico);
    return 0;
}

// Exercício 17 — Área do triângulo
#include <stdio.h>
int main() {
    double base, altura, area;
    printf("Base do triangulo:\n");
    scanf("%lf", &base);
    printf("Altura do triangulo:\n");
    scanf("%lf", &altura);
    area = (base * altura) / 2;
    printf("A área do triangulo é: %.2lf", area);
    return 0;
}

// Exercício 18 — Circunferência
#include <stdio.h>
#include <math.h>
int main() {
    double raio, cir;
    double pi = 3.14159;
    printf("Fale o raio:\n");
    scanf("%lf", &raio);
    cir = 2 * pi * raio;
    printf("A circuferencia da forma é: %.2lf", cir);
    return 0;
}

// Exercício 19 — Bhaskara
#include <stdio.h>
#include <math.h>
int main() {
    double a, b, c, delta, x1, x2;
    printf("Digite os coeficientes a, b e c:");
    scanf("%lf,%lf,%lf", &a, &b, &c);
    delta = (b * b) - (4 * a * c);
    if (delta < 0) {
        printf("A equação não possui raizes (Delta negativo)");
    } else {
        x1 = (-b + sqrt(delta)) / (2 * a);
        x2 = (-b - sqrt(delta)) / (2 * a);
        printf("Delta: %.2f\n", delta);
        printf("x1: %.4f\n", x1);
        printf("x2: %.4f\n", x2);
    }
    return 0;
}

// Exercício 20 — Converter horas em segundos
#include <stdio.h>
int main() {
    double ho, mi, se, con;
    printf("Que horas são?\n");
    scanf("%lf:%lf:%lf", &ho, &mi, &se);
    con = (ho * 3600) + (mi * 60) + se;
    printf("Era %.0lf:%.0lf:%.0lf. O total em segundos e: %.0lf\n", ho, mi, se, con);
    return 0;
}

// -------------------------------------------------------
// AULA 03 — IF / ELSE
// -------------------------------------------------------

// Exercício — Raiz quadrada, cúbica ou quarta
#include <stdio.h>
#include <string.h>
#include <math.h>
int main() {
    double n1, resu;
    char escolha[20];
    printf("Digite um numero: ");
    scanf("%lf", &n1);
    printf("Qual raiz voce quer calcular? (quadrada, cubica ou quarta): ");
    scanf("%s", escolha);
    if (strcmp(escolha, "quadrada") == 0) {
        resu = sqrt(n1);
        printf("A raiz quadrada de %.2lf e: %.2lf\n", n1, resu);
    } else if (strcmp(escolha, "cubica") == 0) {
        resu = cbrt(n1);
        printf("A raiz cubica de %.2lf e: %.2lf\n", n1, resu);
    } else if (strcmp(escolha, "quarta") == 0) {
        resu = pow(n1, 0.25);
        printf("A raiz quarta de %.2lf e: %.2lf\n", n1, resu);
    } else {
        printf("Essa opcao ainda nao foi inserida ou esta incorreta.\n");
    }
    return 0;
}

// -------------------------------------------------------
// AULA 04 — EXERCÍCIOS PRÓPRIOS
// -------------------------------------------------------

// Meu exercício 1 — Folha de pagamento com INSS e IRRF
#include <stdio.h>
int main() {
    char nome[50];
    double salbruto, inss, irrf, salliquido;
    printf("Qual e seu nome? ");
    scanf("%s", nome);
    printf("Digite seu salario bruto: ");
    scanf("%lf", &salbruto);
    inss = salbruto * 0.11;
    irrf = salbruto * 0.075;
    salliquido = salbruto - inss - irrf;
    printf("\n--- RESULTADO ---\n");
    printf("Funcionario: %s\n", nome);
    printf("Desconto INSS: %.2lf\n", inss);
    printf("Desconto IRRF: %.2lf\n", irrf);
    printf("Salario Liquido: %.2lf\n", salliquido);
    return 0;
}

// Meu exercício 2 — Gasolina ou álcool?
#include <stdio.h>
int main() {
    double precog, precoa, rela;
    printf("Quanto é o litro da gasolina: ");
    scanf("%lf", &precog);
    printf("Quanto é o litro do alcool: ");
    scanf("%lf", &precoa);
    rela = precoa / precog;
    if (rela <= 0.70)
        printf("Abasteça com alcool!");
    else
        printf("Abasteça com gasolina!");
    return 0;
}

// Meu exercício 3 — IMC
#include <stdio.h>
int main() {
    double indice, peso, altura;
    printf("Digite seu peso e altura: ");
    scanf("%lf,%lf", &peso, &altura);
    indice = peso / (altura * altura);
    if (indice < 18.5)
        printf("Abaixo do peso");
    else if (indice >= 18.5 && indice <= 24.9)
        printf("Peso normal");
    else if (indice >= 25.0 && indice <= 29.9)
        printf("Acima do peso");
    else
        printf("Obesidade");
    return 0;
}

// -------------------------------------------------------
// AULA 05 — FOR E WHILE
// -------------------------------------------------------

// Exercício — FOR básico
#include <stdio.h>
int main() {
    int i;
    for (i = 1; i <= 10; i++) {
        printf("%d\n", i);
    }
    return 0;
}

// Exercício — WHILE básico
#include <stdio.h>
int main() {
    int i = 1;
    while (i <= 10) {
        printf("%d\n", i);
        i++;
    }
    return 0;
}

// -------------------------------------------------------
// AULA 06 — VETORES E MATRIZES
// -------------------------------------------------------

// Exercício — Vetor simples
#include <stdio.h>
int main() {
    int vetor[5];
    int i;
    for (i = 0; i < 5; i++) {
        printf("Digite o valor %d: ", i+1);
        scanf("%d", &vetor[i]);
    }
    for (i = 0; i < 5; i++) {
        printf("vetor[%d] = %d\n", i, vetor[i]);
    }
    return 0;
}

// Exercício — Matriz
#include <stdio.h>
int main() {
    int matriz[3][2];
    int i = 0, j = 0;
    printf("Digite os dados da matriz...\n");
    for (i = 0; i <= 2; i++) {
        for (j = 0; j <= 1; j++) {
            printf("matriz[%d][%d] = ", i, j);
            scanf("%d", &matriz[i][j]);
        }
    }
    printf("\nDados da matriz....\n");
    for (i = 0; i <= 2; i++) {
        for (j = 0; j <= 1; j++) {
            printf("matriz[%d][%d] = %d\n", i, j, matriz[i][j]);
        }
    }
    return 0;
}

// -------------------------------------------------------
// AULA 07 — STRUCTS
// -------------------------------------------------------

// Exercício — Struct Aluno
#include <stdio.h>
typedef struct {
    int ra;
    char nome[20];
    double altura;
} Aluno;

int main() {
    Aluno al;
    printf("Digite o RA: ");
    scanf(" %d", &al.ra);
    printf("Digite o nome: ");
    scanf(" %19[^\n]", &al.nome);
    printf("Digite a altura: ");
    scanf(" %lf", &al.altura);
    printf("\nDados do aluno:\n");
    printf("RA = %d\n", al.ra);
    printf("Nome = %s\n", al.nome);
    printf("Altura = %.2lf\n", al.altura);
}

// Exercício — Struct Carro
#include <stdio.h>
typedef struct {
    int modelo;
    char nome[20];
    char placa[20];
    int peso;
    char marca[20];
} carro;

int main() {
    carro al;
    printf("Digite o nome do carro: ");
    scanf(" %19[^\n]", &al.nome);
    printf("Digite o ano do carro: ");
    scanf(" %d", &al.modelo);
    printf("Digite a placa do carro: ");
    scanf(" %19[^\n]", &al.placa);
    printf("Digite a marca do carro: ");
    scanf(" %19[^\n]", &al.marca);
    printf("Digite o peso do carro: ");
    scanf(" %d", &al.peso);
    printf("\nDados do carro:\n");
    printf("Nome = %s\n", al.nome);
    printf("Ano = %d\n", al.modelo);
    printf("Marca = %s\n", al.marca);
    printf("Placa = %s\n", al.placa);
    printf("Peso = %d\n", al.peso);
}

// -------------------------------------------------------
// AULA 08 — FUNÇÕES (VOID E RETORNO)
// -------------------------------------------------------

// Exercício — Função void e int
#include <stdio.h>

void mostrar_idade(int ano_atual, int ano_nasc) {
    int idade = ano_atual - ano_nasc;
    printf("Idade usando funcao tipo void = %d anos\n", idade);
}

int pegar_idade(int ano_atual, int ano_nasc) {
    int idade = ano_atual - ano_nasc;
    return idade;
}

int main() {
    int an, aa;
    printf("Calculo de idade\n\n");
    printf("Digite o ano atual: ");
    scanf(" %d", &aa);
    printf("Digite o ano de nascimento: ");
    scanf(" %d", &an);
    printf("\n");
    mostrar_idade(aa, an);
    printf("Idade usando funcao tipo int = %d anos\n", pegar_idade(aa, an));
    return 0;
}

// Exercício — Função IMC
#include <stdio.h>

void resul(double peso, double altura) {
    double indice = peso / (altura * altura);
    printf("Seu IMC: %.1lf\n", indice);
    if (indice < 18.5) printf("Abaixo do peso\n");
    else if (indice <= 24.9) printf("Peso normal\n");
    else if (indice <= 29.9) printf("Sobrepeso\n");
    else printf("Obesidade\n");
}

int main() {
    double n1, n2;
    printf("Vamos calcular seu imc..\n\n");
    printf("Digite o peso e altura(n1,n2): ");
    scanf(" %lf,%lf", &n1, &n2);
    resul(n1, n2);
    return 0;
}

// Exercício dor de cabeça — Struct com função retornando struct
#include <stdio.h>

typedef struct {
    int soma;
    int meno;
    int mul;
    int divo;
} resul;

resul calcular(int n1, int n2, int n3) {
    resul re;
    re.soma = n1 + n2 + n3;
    re.meno = n1 - n2 - n3;
    re.mul  = n1 * n2 * n3;
    if (n2 != 0 && n3 != 0) {
        re.divo = n1 / n2 / n3;
    } else {
        re.divo = 0;
    }
    return re;
}

int main() {
    int n1, n2, n3, es;
    resul resposta;
    printf("Digite tres numero (1,1,1): ");
    scanf(" %d,%d,%d", &n1, &n2, &n3);
    printf("\nQual operação deseja realizar?\n Soma-1\n Sub-2\n Multi-3\n Divi-4\n Todas-5\n");
    scanf(" %d", &es);
    resposta = calcular(n1, n2, n3);
    if (es == 1 || es == 5) printf("%d + %d + %d = %d\n", n1, n2, n3, resposta.soma);
    if (es == 2 || es == 5) printf("%d - %d - %d = %d\n", n1, n2, n3, resposta.meno);
    if (es == 3 || es == 5) printf("%d * %d * %d = %d\n", n1, n2, n3, resposta.mul);
    if (es == 4 || es == 5) printf("%d / %d / %d = %d\n", n1, n2, n3, resposta.divo);
    return 0;
}
