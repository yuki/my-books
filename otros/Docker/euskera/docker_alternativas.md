
# Docker-en alternatibak {#alternativas-docker}

Gaur egun Docker kontainer-sistemak sortzeko tresnarik zabalduena bada ere, 2015ean ***[Open Container Initiative](https://es.wikipedia.org/wiki/Open_Container_Initiative)*** (OCI) sortu zen. Linux Fundazioaren proiektu bat da, estandar ireki bat diseinatzeko, kontainer-plataformak enpresa edo proiektu jakin bati lotuta ez egoteko.

Gaur egun hiru zehaztapen sortu dira kontainerrak garatzeko eta erabiltzeko, eta haien dokumentazioa [Github](https://github.com/opencontainers) eta [OCIren webgunean](https://opencontainers.org/) aurki daiteke:

* **Irudi-formatua**: Bola eraiki, garraiatu eta prestatu behar den irudiaren [Zehaztapena](https://github.com/opencontainers/image-spec/blob/v1.1.0/spec.md) da, gero kontainer sortzeko erabiliko dena.
* **Exekuzio-ingurunea**: Kontainerren exekuzio-inguruneen portaera eta konfigurazio maila baxukoaren erreferentziazko zehaztapena da. Erreferentziazko programa **[runc](https://github.com/opencontainers/runc)** da, eta normalean goi-mailako aplikazioek deitzen dute, hala nola [containerd](https://containerd.io/) edo [cri-o](https://cri-o.io/).
* **Banaketa**: Edukiaren banaketa errazteko eta estandarizatzeko API [protokoloa](https://github.com/opencontainers/distribution-spec/blob/main/spec.md) definitzen du. Hau *registry* bat (adib. [Docker Hub](https://hub.docker.com/)) edo irudi-biltegi bat sortzeko zatia izango litzateke.


## Containerd eta runc {#containerd-runc}

Aukerarik ***gordinena*** OCIk eskaintzen dituen sistemak erabiltzea da, hau da:

* **Containerd**: Kontainerren exekuziorako zerbitzua.
* **runc**: kontsolako komandoa, kontainerrak sortu eta abiarazteko aukera ematen duena.

Sistema hau, "zuzena" izan arren (sistemako komandoak zuzenean erabiltzen dituelako), konplexuagoa izan daiteke. Zenbait kasutan, lan batzuk egiteko Docker-ekin edo beste alternatiba batzuekin zuzenean egiten diren ekintza batzuk hemen hainbat pausotan egin behar dira.


## Nerdctl {#nerdctl}

[Nerdctl](https://github.com/containerd/nerdctl) **containerd**-rako komando-lerroko programa bat da, Docker-ekin bateragarria. **nerdctl**-ek bere *[FAQan](https://github.com/containerd/nerdctl/blob/main/docs/faq.md)* azaltzen duen bezala, Docker-ek ez dituen baina *containerd*-ek dituen ezaugarri aurreratuak errazago erabiltzea eta esperimentatzea helburua da.

Komando-lerro mailan Docker-ekin bateragarria denez, Docker-ekin egiten jakin dugun edozein lan nerdctl erabiliz ere egin dezakegu:

::: mycode
[Egiaztatu kontainerrren egoera nerdctl-rekin]{.title}

``` console
ruben@vega:~$ nerdctl ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
:::


## Podman {#podman}

[Podman](https://podman.io/) kontainerrak, irudiak, *[podak](https://kubernetes.io/docs/concepts/workloads/pods/#what-is-a-pod)* eta [Kubernetes](https://kubernetes.io/docs/home/)-en kontrola modu lokalean kudeatzeko sistema bat da. [Red Hat](https://es.wikipedia.org/wiki/Red_Hat)-ek garatua da.

Podman-ek Docker Desktop-en antzeko interfaze grafikoa dauka, eta honek bezala, Windows eta MacOS inguruneetan barnean Podman exekutatuko den Linux sistema batekin makina birtual bat sortuko du.

![Podman mahaigaineko aplikazioa](img/docker/podman.png){width="100%"}


