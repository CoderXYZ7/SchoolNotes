# Esecizio 1

Disegnare i fasori corrispondenti alle correnti I1, I2 relative a due bipoli collegati in parllelo, sapendo che si tratta di correnti sisnusoidali alla frequenza di f = 50Hz, con valori efficaci I1 = 3A, I2 = 4A e fasi rispettivamente pari a φ1 = -135° e φ2 = +90°.
Calcolare il valore efficace, il valore massimo e la fase della somma risultante I e scriverne l'espressione analitica il funzione del tempo.

---
Per affrontare questo problema:

1.  **Calcolare i fasori delle correnti I1I_1 e I2I_2**:
    
    -   Il fasore I1I_1 è dato da I1=3∠−135∘I_1 = 3 \angle -135^\circ.
    -   Il fasore I2I_2 è dato da I2=4∠90∘I_2 = 4 \angle 90^\circ.
2.  **Somma dei fasori**: Sommiamo i fasori nel piano complesso.
    
3.  **Valore efficace, massimo e fase della corrente risultante II**:
    
    -   Il valore efficace è la norma del fasore risultante.
    -   Il valore massimo è dato da 2×Ieff\sqrt{2} \times I_{\text{eff}}.
    -   La fase è l'angolo del fasore risultante.
4.  **Espressione nel tempo della corrente i(t)i(t)**: La corrente sarà del tipo i(t)=2Ieffcos⁡(ωt+φ)i(t) = \sqrt{2} I_{\text{eff}} \cos(\omega t + \varphi), dove ω=2πf\omega = 2 \pi f è la pulsazione.
    

Passo alla risoluzione calcolando i fasori e la loro somma.

### Calcoli dei fasori e loro somma:

1.  **Fasori delle correnti:**
    
    -   I1=−2.12−2.12j AI_1 = -2.12 - 2.12j \, \text{A} (in forma complessa).
    -   I2=0+4j AI_2 = 0 + 4j \, \text{A} (in forma complessa).
2.  **Somma dei fasori:**
    
    -   I=I1+I2=−2.12+1.88j AI = I_1 + I_2 = -2.12 + 1.88j \, \text{A}.
3.  **Valori risultanti:**
    
    -   **Valore efficace**: Ieff=2.83 AI_{\text{eff}} = 2.83 \, \text{A}.
    -   **Valore massimo**: Imax=4.01 AI_{\text{max}} = 4.01 \, \text{A}.
    -   **Fase**: φ=138.47∘\varphi = 138.47^\circ.

----------

### Espressione analitica della corrente nel tempo:

La corrente risultante è data da:

i(t)=2⋅Ieff⋅cos⁡(ωt+φ)i(t) = \sqrt{2} \cdot I_{\text{eff}} \cdot \cos(\omega t + \varphi)

dove:

-   Ieff=2.83 AI_{\text{eff}} = 2.83 \, \text{A},
-   ω=2π⋅50=314.16 rad/s\omega = 2 \pi \cdot 50 = 314.16 \, \text{rad/s},
-   φ=138.47∘=2.42 rad\varphi = 138.47^\circ = 2.42 \, \text{rad}.

Espressione nel tempo:

i(t)=4.01cos⁡(314.16t+138.47∘) Ai(t) = 4.01 \cos(314.16 t + 138.47^\circ) \, \text{A}

----------

### Disegno dei fasori:

Procedo con la rappresentazione grafica dei fasori I1I_1, I2I_2, e II.

Ecco la rappresentazione grafica dei fasori:

![enter image description here](http://localhost/resources/e96056ac-b08e-42a3-ae93-6f63d1b2c559.png)

-   I1I_1: in **blu**, con ampiezza 3 A3 \, \text{A} e fase −135∘-135^\circ.
-   I2I_2: in **verde**, con ampiezza 4 A4 \, \text{A} e fase +90∘+90^\circ.
-   II: in **rosso**, rappresenta la somma vettoriale dei due fasori.


---

# Esercizio 2

Un bipolo RLC parallelo Assorbe le potenze P = 1W, Ql = 0.3VAR, S = 1.5VA ed è alimentato con tensione V = 10V alla frequenza f = 50Hz.
Calcololare: il valore efficace della corrente totale, R, L, C ed il fattore di potenza (cos φ). Disegnare infine il triangolo delle potenze.

---
Per risolvere il problema:

### Dati forniti:

-   Potenza attiva P=1 WP = 1 \, \text{W}
-   Potenza reattiva induttiva QL=0.3 VARQ_L = 0.3 \, \text{VAR}
-   Potenza apparente S=1.5 VAS = 1.5 \, \text{VA}
-   Tensione efficace V=10 VV = 10 \, \text{V}
-   Frequenza f=50 Hzf = 50 \, \text{Hz}

### Passaggi:

1.  **Calcolare la corrente efficace totale II:**
    
    I=SVI = \frac{S}{V}
2.  **Fattore di potenza cos⁡φ\cos\varphi:**
    
    cos⁡φ=PS\cos\varphi = \frac{P}{S}
    
    Da qui si ottiene φ\varphi.
    
3.  **Calcolare RR, LL, CC:**
    
    -   Resistenza equivalente: R=V2PR = \frac{V^2}{P}
    -   Parte reattiva del circuito (Q=QLQ = Q_L): XL=V2QL,XC=0 (non specificato un QC)X_L = \frac{V^2}{Q_L}, \quad X_C = 0 \, \text{(non specificato un \( Q_C \))}
    -   Induttanza: L=XL2πfL = \frac{X_L}{2 \pi f}
    -   Capacitanza: Se fosse specificato un valore reattivo capacitivo, CC si calcola da XCX_C: C=12πfXCC = \frac{1}{2 \pi f X_C}
4.  **Triangolo delle potenze:** Disegno con PP, QLQ_L, e SS.
    

Procedo con i calcoli.

### Risultati dei calcoli:

1.  **Corrente totale efficace**:
    
    I=0.15 AI = 0.15 \, \text{A}
2.  **Fattore di potenza (cos⁡φ\cos \varphi)**:
    
    cos⁡φ=0.667(φ=48.19∘)\cos\varphi = 0.667 \quad (\varphi = 48.19^\circ)
3.  **Resistenza equivalente (RR)**:
    
    R=100 ΩR = 100 \, \Omega
4.  **Reattanza induttiva (XLX_L)**:
    
    XL=333.33 ΩX_L = 333.33 \, \Omega
5.  **Induttanza (LL)**:
    
    L=1.061 HL = 1.061 \, \text{H}

----------

### Triangolo delle potenze:

Il triangolo delle potenze è definito da:

-   Potenza attiva P=1 WP = 1 \, \text{W} (cateto orizzontale).
-   Potenza reattiva QL=0.3 VARQ_L = 0.3 \, \text{VAR} (cateto verticale).
-   Potenza apparente S=1.5 VAS = 1.5 \, \text{VA} (ipotenusa).

---

# Esercizio 3

Dato il circuito il figura [Un generatore in di corrente alternata, i cui poli sono denominati A e B, collegato a un condensatore (C = 50uF) e una resistenza (R = 50 ohm) in parallelo, con I1 rappresentatnte la corrente al nodo in cui si separano i rami di C ed R, I2 la corrente sul ramo della resistenza e I3 la corrente sul ramo del condensatore] , ipotizziamo I1 di modulo 1A e fase 0°:
1) calcolare l'impedenza ZAB equivalente.
2) disegnare sul piano di gauss i fasori relativi a corrente e tensione.
3) calcolare le potenze P, Q, S ed il fattore di potenza.

---


---