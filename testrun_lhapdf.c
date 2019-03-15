#include <stdio.h>
#include "lhapdf_c.h"

int main(void) {
    CPDF *pdf = mkPDF("NNPDF23_lo_as_0130_qed");

    const double MZ = 91.1876;
    const double alphas = alphasQ(pdf, MZ);
    printf("\\alpha_s(m_Z) = %f\n", alphas);

    rmPDF(pdf);
}
