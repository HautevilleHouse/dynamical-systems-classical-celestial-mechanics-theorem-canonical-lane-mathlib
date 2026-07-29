import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure OrbitStabilityPackage where
  centralForceField : Prop
  periodicOrbitExists : Prop
  lyapunovStability : Prop
  perturbationalBound : Prop

def OrbitStabilityClosed (S : OrbitStabilityPackage) : Prop :=
  S.centralForceField ∧ S.periodicOrbitExists ∧ S.lyapunovStability ∧ S.perturbationalBound

structure OrbitStabilityEvidence (S : OrbitStabilityPackage) where
  centralForceFieldClosed : S.centralForceField
  periodicOrbitExistsClosed : S.periodicOrbitExists
  lyapunovStabilityClosed : S.lyapunovStability
  perturbationalBoundClosed : S.perturbationalBound

theorem orbit_stability_closed_from_evidence (S : OrbitStabilityPackage) (E : OrbitStabilityEvidence S) :
    OrbitStabilityClosed S := by
  exact And.intro E.centralForceFieldClosed
    (And.intro E.periodicOrbitExistsClosed
      (And.intro E.lyapunovStabilityClosed E.perturbationalBoundClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse