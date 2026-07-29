import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure NBodyHamiltonianPackage where
  masses : List ℝ
  positions : List (ℝ × ℝ × ℝ)
  momenta : List (ℝ × ℝ × ℝ)
  kineticEnergy : ℝ
  potentialEnergy : ℝ
  totalEnergy : ℝ
  hamiltonianEquations : Prop

structure NBodyHamiltonianEvidence (H : NBodyHamiltonianPackage) where
  kineticEnergyClosed : H.kineticEnergy = 0.5 * (∑ i, (H.momenta[i].1^2 + H.momenta[i].2^2 + H.momenta[i].3^2) / H.masses[i])
  potentialEnergyClosed : H.potentialEnergy = -∑ i < j, (H.masses[i] * H.masses[j]) / distance H.positions[i] H.positions[j]
  totalEnergyClosed : H.totalEnergy = H.kineticEnergy + H.potentialEnergy
  hamiltonianEquationsClosed : H.hamiltonianEquations

def NBodyHamiltonianClosed (H : NBodyHamiltonianPackage) : Prop :=
  H.kineticEnergy = 0.5 * (∑ i, (H.momenta[i].1^2 + H.momenta[i].2^2 + H.momenta[i].3^2) / H.masses[i]) ∧
  H.potentialEnergy = -∑ i < j, (H.masses[i] * H.masses[j]) / distance H.positions[i] H.positions[j] ∧
  H.totalEnergy = H.kineticEnergy + H.potentialEnergy ∧
  H.hamiltonianEquations

theorem n_body_hamiltonian_closed_from_evidence (H : NBodyHamiltonianPackage) (E : NBodyHamiltonianEvidence H) : NBodyHamiltonianClosed H :=
  And.intro E.kineticEnergyClosed (And.intro E.potentialEnergyClosed (And.intro E.totalEnergyClosed E.hamiltonianEquationsClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
