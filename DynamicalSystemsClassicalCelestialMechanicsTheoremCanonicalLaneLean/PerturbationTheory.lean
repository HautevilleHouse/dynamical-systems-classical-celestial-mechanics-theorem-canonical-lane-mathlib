import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure PerturbationAnalysis where
  unperturbedSystem : Prop
  perturbationParameter : ℝ
  seriesExpansion : Prop
  secularTermsControlled : Prop
  averagingMethodApplied : Prop

structure PerturbationEvidence (P : PerturbationAnalysis) where
  unperturbedSystemClosed : P.unperturbedSystem
  seriesExpansionClosed : P.seriesExpansion
  secularTermsControlledClosed : P.secularTermsControlled
  averagingMethodAppliedClosed : P.averagingMethodApplied

def PerturbationClosed (P : PerturbationAnalysis) : Prop :=
  P.unperturbedSystem ∧ P.seriesExpansion ∧ P.secularTermsControlled ∧ P.averagingMethodApplied

theorem perturbation_closed_from_evidence (P : PerturbationAnalysis) (E : PerturbationEvidence P) :
    PerturbationClosed P := by
  exact And.intro E.unperturbedSystemClosed (And.intro E.seriesExpansionClosed (And.intro E.secularTermsControlledClosed E.averagingMethodAppliedClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse