import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure SymplecticReductionPackage where
  phaseSpace : Type u
  symplecticForm : Prop
  momentumMap : Prop
  reductionBySymmetry : Prop
  integrabilityImplication : Prop

def SymplecticReductionClosed (S : SymplecticReductionPackage) : Prop :=
  S.symplecticForm ∧ S.momentumMap ∧ S.reductionBySymmetry ∧ S.integrabilityImplication

structure SymplecticReductionEvidence (S : SymplecticReductionPackage) where
  symplecticFormClosed : S.symplecticForm
  momentumMapClosed : S.momentumMap
  reductionBySymmetryClosed : S.reductionBySymmetry
  integrabilityImplicationClosed : S.integrabilityImplication

theorem symplectic_reduction_closed_from_evidence (S : SymplecticReductionPackage) (E : SymplecticReductionEvidence S) :
    SymplecticReductionClosed S := by
  exact And.intro E.symplecticFormClosed
    (And.intro E.momentumMapClosed
      (And.intro E.reductionBySymmetryClosed E.integrabilityImplicationClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse