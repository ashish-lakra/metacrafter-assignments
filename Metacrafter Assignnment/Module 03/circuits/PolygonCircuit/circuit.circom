pragma circom 2.0.0;

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;// AND gate: Output is 1 if both inputs are 1, otherwise 0
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;// OR gate: Output is 1 if at least one input is 1, otherwise 0
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in;// NOT gate: Output is the negation of the input (1 if input is 0, and 0 if input is 1)
}

template PolygonCircuit () {
    // Input signals
    signal input a;
    signal input b;

    // Intermediate signals
    signal x; // Intermediate signal to store orGate1's output
    signal y; // Intermediate signal to store notGate1's output
    signal z; // Intermediate signal to store notGate2's output
    signal w; // Intermediate signal to store orGate2's output

    // Output signal
    signal output q; // Final output signal

    // Create gates
    component orGate1 = OR(); // First OR gate
    component orGate2 = OR(); // Second OR gate
    component notGate1 = NOT(); // First NOT gate
    component notGate2 = NOT(); // Second NOT gate
    component notGate3 = NOT(); // Third NOT gate
    component andGate = AND(); // AND gate

    // Connect circuit logic
    orGate1.a <== a;
    orGate1.b <== b;
    x <== orGate1.out; // Store orGate1's output in 'x'

    notGate1.in <== a;
    y <== notGate1.out; // Store notGate1's output in 'y'

    notGate2.in <== b;
    z <== notGate2.out; // Store notGate2's output in 'z'

    orGate2.a <== y;
    orGate2.b <== z;
    w <== orGate2.out; // Store orGate2's output in 'w'

    notGate3.in <== x;
    andGate.a <== notGate3.out;
    andGate.b <== w;

    q <== andGate.out; // Final output is andGate's output 'q'
}

component main = PolygonCircuit(); // Instantiate the PolygonCircuit circuit
