import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure KAMStabilityPackage where
  perturbationParameter : ℝ
  nondegeneracyCondition : Prop
  diophantineCondition : Prop
  invariantTori : Prop
  stabilityOverFiniteTime : Prop

structure KAMStabilityEvidence (K : KAMStabilityPackage) where
  nondegeneracyConditionClosed : K.nondegeneracyCondition
  diophantineConditionClosed : K.diophantineCondition
  invariantToriClosed : K.invariantTori
  stabilityOverFiniteTimeClosed : K.stabilityOverFiniteTime

def KAMStabilityClosed (K : KAMStabilityPackage) : Prop :=
  K.nondegeneracyCondition ∧ K.diophantineCondition ∧ K.invariantTori ∧ K.stabilityOverFiniteTime

theorem kam_stability_closed_from_evidence (K : KAMStabilityPackage) (E : KAMStabilityEvidence K) : KAMStabilityClosed K := by
  exact And.intro E.nondegeneracyConditionClosed
    (And.intro E.diophantineConditionClosed
      (And.intro E.invariantToriClosed E.stabilityOverFiniteTimeClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse