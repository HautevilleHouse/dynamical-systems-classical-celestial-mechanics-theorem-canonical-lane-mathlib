import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean.HamiltonianMechanics

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure LiouvilleIntegrable {H : HamiltonianSystem} where
  involutiveIntegrals : List (H.phaseSpace → ℝ)
  independenceCondition : Prop
  actionAngleVariables : Prop
  integrabilityEstablished : Prop

structure IntegrabilityEvidence {H : HamiltonianSystem} (I : LiouvilleIntegrable H) where
  independenceConditionClosed : I.independenceCondition
  actionAngleVariablesClosed : I.actionAngleVariables
  integrabilityEstablishedClosed : I.integrabilityEstablished

def LiouvilleIntegrableClosed {H : HamiltonianSystem} (I : LiouvilleIntegrable H) : Prop :=
  I.independenceCondition ∧ I.actionAngleVariables ∧ I.integrabilityEstablished

theorem liouville_integrable_closed_from_evidence {H : HamiltonianSystem}
    (I : LiouvilleIntegrable H) (E : IntegrabilityEvidence I) : LiouvilleIntegrableClosed I := by
  exact And.intro E.independenceConditionClosed (And.intro E.actionAngleVariablesClosed E.integrabilityEstablishedClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse