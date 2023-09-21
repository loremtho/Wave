using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Redcode.Pools;

public class Enemy : MonoBehaviour 
{

  

   
    public Transform target;
    NavMeshAgent ai;
    Rigidbody rigid;
    BoxCollider boxCollider;

    public BoxCollider meleeArea;

    public bool isAttack;

    public Animator anim;

    public bool isChase;

    private int hp;
    private int currentHp;


      void FreezeVelocity()
    {
        if(isChase)
        {
            rigid.velocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
        }
 
    }


    void FixedUpdate()
    {
        FreezeVelocity();
        Targerting();

    }


    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        boxCollider = GetComponent<BoxCollider>();
        ai = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
        

        Invoke("ChaseStart", 2);

    }

    void ChaseStart()
    {
        isChase = true;
        anim.SetBool("isWalk", true);


    }

    void Update()
    {
        if(isChase) //
        {
            ai.SetDestination(target.position); //추적코드
        }

    }

    void Targerting()
    {
        float targetRadius = 1.5f;
        float targetRange = 3f;

        RaycastHit[] rayHits =
        Physics.SphereCastAll(transform.position,
        targetRadius,
        transform.forward,
        targetRange,
        LayerMask.GetMask("Player"));

        if(rayHits.Length > 0 && !isAttack)
        {
            StartCoroutine(Attack());
        }


    }

    IEnumerator Attack()
    {
        isAttack = true;
        anim.SetBool("isAttack", true);
        meleeArea.enabled = true;

        yield return new WaitForSeconds(0.2f);
        meleeArea.enabled = true;

        yield return new WaitForSeconds(1f);
        meleeArea.enabled = false;
        
        isAttack = false;
        anim.SetBool("isAttack", false);
        
    }

    IEnumerator OnDamage()
    {

        //mat.color = Color.red;

        yield return new WaitForSeconds(0.1f);

    }



 
}
