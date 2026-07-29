import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure IntegrableHamiltonianSystemPackage where
  phaseSpace : Type u
  hamiltonian : Type v
  poissonBracket : Type w
  firstIntegrals : Prop
  actionAngleCoordinates : Prop
  integrabilityConditions : Prop

structure HamiltonianIntegrabilityEvidence (H : IntegrableHamiltonianSystemPackage) where
  firstIntegralsClosed : H.firstIntegrals
  actionAngleCoordinatesClosed : H.actionAngleCoordinates
  integrabilityConditionsClosed : H.integrabilityConditions

def HamiltonianIntegrabilityClosed (H : IntegrableHamiltonianSystemPackage) : Prop :=
  H.firstIntegrals ∧ H.actionAngleCoordinates ∧ H.integrabilityConditions

theorem hamiltonian_integrability_closed_from_evidence (H : IntegrableHamiltonianSystemPackage) (E : HamiltonianIntegrabilityEvidence H) : HamiltonianIntegrabilityClosed H := by
  exact And.intro E.firstIntegralsClosed (And.intro E.actionAngleCoordinatesClosed E.integrabilityConditionsClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse