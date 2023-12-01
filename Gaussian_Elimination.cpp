#include<iostream>
using namespace std;

int main() {
    double time[] = {5, 8, 12};
    double velocity[] = {106.8, 177.2, 279.2};

    double A[3][3] = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
    double X[3] = {106.8, 177.2, 279.2};

    // Naive Gauss Elimination
    for (int i = 0; i < 3; i++) {
        for (int j = i + 1; j < 3; j++) {
            double ratio = A[j][i] / A[i][i];
            for (int k = 0; k < 3; k++) {
                A[j][k] -= ratio * A[i][k];
            }
            X[j] -= ratio * X[i];
        }
    }

    // Backward substitution
    double a[3];
    for (int i = 2; i >= 0; i--) {
        a[i] = X[i];
        for (int j = i + 1; j < 3; j++) {
            a[i] -= A[i][j] * a[j];
        }
        a[i] /= A[i][i];
    }

    // Display coefficients
    cout << "a1: " << a[0] << endl;
    cout << "a2: " << a[1] << endl;
    cout << "a3: " << a[2] << endl;

    // Calculate and display velocity at t=6 seconds
    double t = 6;
    double v = a[0] * t * t + a[1] * t + a[2];
    cout << "Velocity at t=6 seconds: " << v << " m/s" << endl;

    return 0;
}
