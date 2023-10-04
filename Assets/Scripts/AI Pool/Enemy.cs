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

    public ParticleSystem muzzleFlashs;

    public BoxCollider meleeArea;

    public bool isAttack;

    public Animator anim;

    public bool isChase;

    private PlayerController player;

   
    [SerializeField]
    private int Hp;

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

    private void Start()
    {
        player = FindObjectOfType<PlayerController>();
    }



    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        boxCollider = GetComponent<BoxCollider>();
        ai = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
       
        currentHp = Hp;
  
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


     public void TakeDamage(int damage)
    {
        currentHp -= damage;

        // 체력이 0 이하로 떨어지면 몬스터를 파괴
        if (currentHp <= 0)
        {
            Die();
            muzzleFlashs.Play();
            

        }

        anim.SetTrigger("Hit");
        muzzleFlashs.Play();
    }
    private void Die()
    {
        Destroy(gameObject);
        player.AddScore(20);
       
    }


 
}
