import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure NBodyProblemPackage where
  masses : Nat → ℝ
  positions : Nat → ℝᵈ
  momenta : Nat → ℝᵈ
  inverseSquareForce : Prop
  conservationLaws : Prop
  centerOfMassFixed : Prop

structure NBodyProblemEvidence (N : NBodyProblemPackage) where
  inverseSquareForceClosed : N.inverseSquareForce
  conservationLawsClosed : N.conservationLaws
  centerOfMassFixedClosed : N.centerOfMassFixed

def NBodyProblemClosed (N : NBodyProblemPackage) : Prop :=
  N.inverseSquareForce ∧ N.conservationLaws ∧ N.centerOfMassFixed

theorem n_body_problem_closed_from_evidence (N : NBodyProblemPackage) (E : NBodyProblemEvidence N) : NBodyProblemClosed N := by
  exact And.intro E.inverseSquareForceClosed (And.intro E.conservationLawsClosed E.centerOfMassFixedClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse