import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure PerturbationPackage (n : Nat) where
  referenceOrbit : Type u
  smallParameter : Type v
  kozaiLidovMechanism : Prop
  stabilityCondition : Prop
  averagingProcedure : Prop

structure PerturbationEvidence {n : Nat} (P : PerturbationPackage n) where
  kozaiLidovMechanismClosed : P.kozaiLidovMechanism
  stabilityConditionClosed : P.stabilityCondition
  averagingProcedureClosed : P.averagingProcedure

def PerturbationClosed {n : Nat} (P : PerturbationPackage n) : Prop :=
  P.kozaiLidovMechanism ∧ P.stabilityCondition ∧ P.averagingProcedure

theorem perturbation_closed_from_evidence {n : Nat} (P : PerturbationPackage n) (Ev : PerturbationEvidence P) : PerturbationClosed P :=
  And.intro Ev.kozaiLidovMechanismClosed (And.intro Ev.stabilityConditionClosed Ev.averagingProcedureClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse