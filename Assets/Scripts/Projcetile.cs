using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projcetile : MonoBehaviour
{
    [SerializeField] float speed = 40;
    private Rigidbody bulletRig;
    void Awake()
    {
        bulletRig = GetComponent<Rigidbody>();
    }

    private void Start() {
        bulletRig.velocity = transform.forward * speed;
    }

    private void OnTriggerEnter(Collider other) 
    {
        Destroy(this.gameObject);
    }
}
