# Esercizio 4

\[
f(x) = 
\begin{cases} 
(3-k)x, & \text{se } x < k \\
2x^2 - 6x, & \text{se } x \geq k
\end{cases}
\]


- **Condizione di Continuità**
Una funzione è continua in \( x = k \) se:

\[
\lim_{x \to k^-} f(x) = \lim_{x \to k^+} f(x) = f(k)
\]

### **Limiti**
- **sinistro** (\( x \to k^- \)):  

  \[
  \lim_{x \to k^-} f(x) = (3-k)k
  \]

- **destro** (\( x \to k^+ \)):  

  \[
  \lim_{x \to k^+} f(x) = 2k^2 - 6k
  \]

- **Valore della funzione in \( x = k \)**:  
  \( f(k) \) è dato dalla seconda espressione (per \( x \geq k \)):

  \[
  f(k) = 2k^2 - 6k
  \]

Affinché \( f(x) \) sia continua in \( x = k \), dobbiamo imporre:

\[
(3-k)k = 2k^2 - 6k
\]

### **Equazione**

\[
(3-k)k = 2k^2 - 6k
\]

\[
3k - k^2 = 2k^2 - 6k
\]

\[
3k - k^2 - 2k^2 + 6k = 0
\]

\[
-3k^2 + 9k = 0
\]

\[
3k(3 - k) = 0
\]

soluzioni:

\[
k = 0 \quad \text{oppure} \quad k = 3
\]