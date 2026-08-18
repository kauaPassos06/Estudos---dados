// =====================================================
// EXERCÍCIOS JAVA — ORIENTAÇÃO A OBJETOS
// =====================================================

// -------------------------------------------------------
// AULA 01 — Classes, Objetos, Getters e Setters
// -------------------------------------------------------

// Versão 1 — método login void
public class Aluno {
    private int ra;
    private String nome;
    private String senha;

    public int getra() { return ra; }
    public void setra(int ra) { this.ra = ra; }

    public String getnome() { return nome; }
    public void setnome(String nome) { this.nome = nome; }

    public void login() {
        if (ra == 123 && nome.equals("Uninove")) {
            System.out.print("Bem vindo calanguito");
        } else {
            System.out.print("Sai daqui seu intruso");
        }
    }
}

class Main {
    public static void main(String[] args) {
        Aluno al = new Aluno();
        al.setra(123);
        al.setnome("Uninove");
        al.login();
    }
}

// -------------------------------------------------------
// Versão 2 — método login com retorno boolean
// -------------------------------------------------------

public class Aluno {
    private int ra;
    private String nome;
    private String senha;

    public int getra() { return ra; }
    public void setra(int ra) { this.ra = ra; }

    public String getnome() { return nome; }
    public void setnome(String nome) { this.nome = nome; }

    public boolean login() {
        if (ra == 123 && nome.equals("Uninove")) {
            return true;
        } else {
            return false;
        }
    }
}

class Main {
    public static void main(String[] args) {
        Aluno al = new Aluno();
        al.setra(123);
        al.setnome("Uninove");

        if (al.login()) {
            System.out.print("Bem vindo calanguito");
        } else {
            System.out.print("Sai daqui");
        }
    }
}
