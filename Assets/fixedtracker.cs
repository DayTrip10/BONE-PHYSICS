using UnityEngine;
using UnityEngine.InputSystem;

namespace Alteruna
{
    public class PlayerVRController : MonoBehaviour
    {
        private Avatar _avatar;
        [SerializeField] private Transform head;
        [SerializeField] private new Camera camera; // Use the 'new' keyword here
        [SerializeField] private int playerSelfLayer;
        [SerializeField] private InputActionProperty positionInput;
        [SerializeField] private InputActionProperty rotationInput;
        [SerializeField] private InputActionProperty trackingStateInput;

        private void Awake()
        {
            _avatar = GetComponent<Avatar>();
        }

        private void Start()
        {
            if (_avatar.IsMe)
            {
                head.gameObject.layer = playerSelfLayer;
                foreach (Transform child in head)
                    child.gameObject.layer = playerSelfLayer;
            }
            else
            {
                // Disable old TrackedPoseDriver components and camera for non-player avatars
                var trackedPoseDrivers = GetComponentsInChildren<UnityEngine.SpatialTracking.TrackedPoseDriver>();
                foreach (var driver in trackedPoseDrivers)
                {
                    driver.enabled = false;
                }

                camera.gameObject.SetActive(false);
            }
        }

        private void Update()
        {
            if (!_avatar.IsMe)
                return;

            // Update the head's local position and rotation using the new Input System
            head.localPosition = positionInput.action.ReadValue<Vector3>();
            head.localRotation = rotationInput.action.ReadValue<Quaternion>();
        }
    }
}
