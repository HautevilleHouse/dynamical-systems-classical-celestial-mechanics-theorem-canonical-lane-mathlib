import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure ThreeBodyFinitenessPackage where
  restrictedProblemFormulation : Prop
  energyMomentumConservation : Prop
  collisionRegularization : Prop
  finiteTimeEscapeBound : Prop

def ThreeBodyFinitenessClosed (T : ThreeBodyFinitenessPackage) : Prop :=
  T.restrictedProblemFormulation ∧ T.energyMomentumConservation ∧ T.collisionRegularization ∧ T.finiteTimeEscapeBound

structure ThreeBodyFinitenessEvidence (T : ThreeBodyFinitenessPackage) where
  restrictedProblemFormulationClosed : T.restrictedProblemFormulation
  energyMomentumConservationClosed : T.energyMomentumConservation
  collisionRegularizationClosed : T.collisionRegularization
  finiteTimeEscapeBoundClosed : T.finiteTimeEscapeBound

theorem three_body_finiteness_closed_from_evidence (T : ThreeBodyFinitenessPackage) (E : ThreeBodyFinitenessEvidence T) :
    ThreeBodyFinitenessClosed T := by
  exact And.intro E.restrictedProblemFormulationClosed
    (And.intro E.energyMomentumConservationClosed
      (And.intro E.collisionRegularizationClosed E.finiteTimeEscapeBoundClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse