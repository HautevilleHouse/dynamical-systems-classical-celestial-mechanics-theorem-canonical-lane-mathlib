import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure ThreeBodySystem where
  masses : List ℝ
  positions : List (ℝ × ℝ × ℝ)
  momenta : List (ℝ × ℝ × ℝ)
  newtonEquations : Prop
  energyConserved : Prop
  angularMomentumConserved : Prop

structure ThreeBodyEvidence (S : ThreeBodySystem) where
  newtonEquationsClosed : S.newtonEquations
  energyConservedClosed : S.energyConserved
  angularMomentumConservedClosed : S.angularMomentumConserved

def ThreeBodyClosed (S : ThreeBodySystem) : Prop :=
  S.newtonEquations ∧ S.energyConserved ∧ S.angularMomentumConserved

theorem three_body_closed_from_evidence (S : ThreeBodySystem) (E : ThreeBodyEvidence S) :
    ThreeBodyClosed S := by
  exact And.intro E.newtonEquationsClosed (And.intro E.energyConservedClosed E.angularMomentumConservedClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse