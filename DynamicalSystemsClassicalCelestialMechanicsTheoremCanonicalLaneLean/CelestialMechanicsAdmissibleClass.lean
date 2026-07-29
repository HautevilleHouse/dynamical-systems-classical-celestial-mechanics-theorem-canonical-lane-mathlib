import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure CelestialMechanicsAdmittedObject where
  system : Type u
  phaseSpace : TopologicalSpace system
  hamiltonian : system → ℝ
  conservedQuantities : List (system → ℝ)
  integrabilityCondition : Prop
  conclusion : integrabilityCondition

structure AdmissibleClass where
  object : CelestialMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CelestialWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
