import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure StabilityOrbitPackage where
  perturbation : ℝ → ℝ × ℝ × ℝ
  referenceOrbit : ℝ → ℝ × ℝ × ℝ
  lyapunovExponent : ℝ
  boundedness : Prop
  asymptoticStability : Prop

structure StabilityOrbitEvidence (S : StabilityOrbitPackage) where
  perturbationSmall : ∀ t, |S.perturbation t| < ε
  lyapunovExponentNegative : S.lyapunovExponent < 0
  boundednessClosed : S.boundedness
  asymptoticStabilityClosed : S.asymptoticStability

def StabilityOrbitClosed (S : StabilityOrbitPackage) : Prop :=
  (∀ t, |S.perturbation t| < ε) ∧ S.lyapunovExponent < 0 ∧ S.boundedness ∧ S.asymptoticStability

theorem stability_orbit_closed_from_evidence (S : StabilityOrbitPackage) (E : StabilityOrbitEvidence S) : StabilityOrbitClosed S :=
  And.intro E.perturbationSmall (And.intro E.lyapunovExponentNegative (And.intro E.boundednessClosed E.asymptoticStabilityClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
