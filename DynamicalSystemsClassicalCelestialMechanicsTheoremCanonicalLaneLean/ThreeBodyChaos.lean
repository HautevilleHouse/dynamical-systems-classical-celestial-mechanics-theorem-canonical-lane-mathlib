import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure ThreeBodyChaosPackage where
  syzygyConditions : Prop
  closeEncounterClassification : Prop
  escapeCriteria : Prop
  symbolicDynamics : Prop
  kolmogorovSinaiEntropy : Prop

structure ThreeBodyChaosEvidence (T : ThreeBodyChaosPackage) where
  syzygyConditionsClosed : T.syzygyConditions
  closeEncounterClassificationClosed : T.closeEncounterClassification
  escapeCriteriaClosed : T.escapeCriteria
  symbolicDynamicsClosed : T.symbolicDynamics
  kolmogorovSinaiEntropyClosed : T.kolmogorovSinaiEntropy

def ThreeBodyChaosClosed (T : ThreeBodyChaosPackage) : Prop :=
  T.syzygyConditions ∧ T.closeEncounterClassification ∧ T.escapeCriteria ∧ T.symbolicDynamics ∧ T.kolmogorovSinaiEntropy

theorem three_body_chaos_closed_from_evidence (T : ThreeBodyChaosPackage) (E : ThreeBodyChaosEvidence T) : ThreeBodyChaosClosed T := by
  exact And.intro E.syzygyConditionsClosed
    (And.intro E.closeEncounterClassificationClosed
      (And.intro E.escapeCriteriaClosed
        (And.intro E.symbolicDynamicsClosed E.kolmogorovSinaiEntropyClosed)))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse