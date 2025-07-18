PGDMP  ,                    }            PROYECTO_LAST    17.4    17.4 >    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Q           1262    16388    PROYECTO_LAST    DATABASE     u   CREATE DATABASE "PROYECTO_LAST" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-PE';
    DROP DATABASE "PROYECTO_LAST";
                     postgres    false            �            1259    16548 
   aplicacion    TABLE     s   CREATE TABLE public.aplicacion (
    id_aplicacion integer NOT NULL,
    nombre character varying(200) NOT NULL
);
    DROP TABLE public.aplicacion;
       public         heap r       postgres    false            �            1259    16547    aplicacion_id_aplicacion_seq    SEQUENCE     �   ALTER TABLE public.aplicacion ALTER COLUMN id_aplicacion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.aplicacion_id_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    224            �            1259    16629 
   asignacion    TABLE     �   CREATE TABLE public.asignacion (
    id_solicitud integer NOT NULL,
    id_colaborador integer NOT NULL,
    fecha_asignacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    coordinador boolean
);
    DROP TABLE public.asignacion;
       public         heap r       postgres    false            �            1259    16647    atencion    TABLE       CREATE TABLE public.atencion (
    id_atencion integer NOT NULL,
    id_solicitud integer,
    id_colaborador integer,
    hora_inicio timestamp without time zone NOT NULL,
    hora_fin timestamp without time zone NOT NULL,
    descripcion character varying(1000) NOT NULL
);
    DROP TABLE public.atencion;
       public         heap r       postgres    false            �            1259    16646    atencion_id_atencion_seq    SEQUENCE     �   ALTER TABLE public.atencion ALTER COLUMN id_atencion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.atencion_id_atencion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    233            �            1259    16425    cliente    TABLE     �  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    tipo_cliente character varying(30) NOT NULL,
    razon_social character varying(30) NOT NULL,
    tipo_documento character varying(50) NOT NULL,
    numero_documento character varying(30) NOT NULL,
    correo character varying(150) NOT NULL,
    direccion character varying(200) NOT NULL,
    telefono character varying(20) NOT NULL,
    fecha_registro date NOT NULL
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    16424    cliente_id_cliente_seq    SEQUENCE     �   ALTER TABLE public.cliente ALTER COLUMN id_cliente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cliente_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    16594    colaborador    TABLE     [  CREATE TABLE public.colaborador (
    id_usuario integer NOT NULL,
    tipo_colaborador character varying(50) NOT NULL,
    CONSTRAINT chk_tipo_colaborador CHECK (((tipo_colaborador)::text = ANY ((ARRAY['programador'::character varying, 'desarrollador'::character varying, 'analista'::character varying, 'admin'::character varying])::text[])))
);
    DROP TABLE public.colaborador;
       public         heap r       postgres    false            �            1259    16489 	   solicitud    TABLE       CREATE TABLE public.solicitud (
    id_solicitud integer NOT NULL,
    id_tipo_solicitud integer,
    motivo character varying(1000),
    fecha_registro date NOT NULL,
    fecha_cierre date,
    estado character varying(30) DEFAULT 'Sin asignar'::character varying NOT NULL,
    id_trabajador integer,
    id_aplicacion integer,
    CONSTRAINT chk_estado_valido CHECK (((estado)::text = ANY ((ARRAY['Sin asignar'::character varying, 'Pendiente'::character varying, 'En proceso'::character varying, 'Cerrado'::character varying])::text[])))
);
    DROP TABLE public.solicitud;
       public         heap r       postgres    false            �            1259    16488    solicitud_id_solicitud_seq    SEQUENCE     �   ALTER TABLE public.solicitud ALTER COLUMN id_solicitud ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.solicitud_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    222            �            1259    16481    tipo_solicitud    TABLE     �   CREATE TABLE public.tipo_solicitud (
    id_tipo_solicitud integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(200),
    estado boolean NOT NULL
);
 "   DROP TABLE public.tipo_solicitud;
       public         heap r       postgres    false            �            1259    16480 $   tipo_solicitud_id_tipo_solicitud_seq    SEQUENCE     �   ALTER TABLE public.tipo_solicitud ALTER COLUMN id_tipo_solicitud ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_solicitud_id_tipo_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            �            1259    16610 
   trabajador    TABLE     \   CREATE TABLE public.trabajador (
    id_usuario integer NOT NULL,
    id_cliente integer
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �            1259    16573    usuario    TABLE       CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    tipo_documento character varying(30) NOT NULL,
    num_documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido_paterno character varying(100) NOT NULL,
    apellido_materno character varying(100) NOT NULL,
    telefono character varying(30) NOT NULL,
    correo character varying(150) NOT NULL,
    fecha_registro date NOT NULL,
    estado boolean,
    contrasenia character varying(150),
    username character varying(50)
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    16572    usuario_id_usuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    228            �            1259    16556    venta    TABLE     �   CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    fecha date NOT NULL,
    id_cliente integer,
    id_aplicacion integer
);
    DROP TABLE public.venta;
       public         heap r       postgres    false            �            1259    16555    venta_id_venta_seq    SEQUENCE     �   ALTER TABLE public.venta ALTER COLUMN id_venta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.venta_id_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    226            B          0    16548 
   aplicacion 
   TABLE DATA           ;   COPY public.aplicacion (id_aplicacion, nombre) FROM stdin;
    public               postgres    false    224   UR       I          0    16629 
   asignacion 
   TABLE DATA           a   COPY public.asignacion (id_solicitud, id_colaborador, fecha_asignacion, coordinador) FROM stdin;
    public               postgres    false    231   �R       K          0    16647    atencion 
   TABLE DATA           q   COPY public.atencion (id_atencion, id_solicitud, id_colaborador, hora_inicio, hora_fin, descripcion) FROM stdin;
    public               postgres    false    233   ;S       <          0    16425    cliente 
   TABLE DATA           �   COPY public.cliente (id_cliente, tipo_cliente, razon_social, tipo_documento, numero_documento, correo, direccion, telefono, fecha_registro) FROM stdin;
    public               postgres    false    218   @U       G          0    16594    colaborador 
   TABLE DATA           C   COPY public.colaborador (id_usuario, tipo_colaborador) FROM stdin;
    public               postgres    false    229   �V       @          0    16489 	   solicitud 
   TABLE DATA           �   COPY public.solicitud (id_solicitud, id_tipo_solicitud, motivo, fecha_registro, fecha_cierre, estado, id_trabajador, id_aplicacion) FROM stdin;
    public               postgres    false    222   HW       >          0    16481    tipo_solicitud 
   TABLE DATA           X   COPY public.tipo_solicitud (id_tipo_solicitud, nombre, descripcion, estado) FROM stdin;
    public               postgres    false    220   �X       H          0    16610 
   trabajador 
   TABLE DATA           <   COPY public.trabajador (id_usuario, id_cliente) FROM stdin;
    public               postgres    false    230   Y       F          0    16573    usuario 
   TABLE DATA           �   COPY public.usuario (id_usuario, tipo_documento, num_documento, nombre, apellido_paterno, apellido_materno, telefono, correo, fecha_registro, estado, contrasenia, username) FROM stdin;
    public               postgres    false    228   8Y       D          0    16556    venta 
   TABLE DATA           K   COPY public.venta (id_venta, fecha, id_cliente, id_aplicacion) FROM stdin;
    public               postgres    false    226   �\       R           0    0    aplicacion_id_aplicacion_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.aplicacion_id_aplicacion_seq', 5, true);
          public               postgres    false    223            S           0    0    atencion_id_atencion_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.atencion_id_atencion_seq', 12, true);
          public               postgres    false    232            T           0    0    cliente_id_cliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 8, true);
          public               postgres    false    217            U           0    0    solicitud_id_solicitud_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.solicitud_id_solicitud_seq', 12, true);
          public               postgres    false    221            V           0    0 $   tipo_solicitud_id_tipo_solicitud_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tipo_solicitud_id_tipo_solicitud_seq', 2, true);
          public               postgres    false    219            W           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 23, true);
          public               postgres    false    227            X           0    0    venta_id_venta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.venta_id_venta_seq', 11, true);
          public               postgres    false    225            �           2606    16552    aplicacion pk_aplicacion 
   CONSTRAINT     a   ALTER TABLE ONLY public.aplicacion
    ADD CONSTRAINT pk_aplicacion PRIMARY KEY (id_aplicacion);
 B   ALTER TABLE ONLY public.aplicacion DROP CONSTRAINT pk_aplicacion;
       public                 postgres    false    224            �           2606    16653    atencion pk_atencion 
   CONSTRAINT     [   ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT pk_atencion PRIMARY KEY (id_atencion);
 >   ALTER TABLE ONLY public.atencion DROP CONSTRAINT pk_atencion;
       public                 postgres    false    233            �           2606    16431    cliente pk_cliente 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (id_cliente);
 <   ALTER TABLE ONLY public.cliente DROP CONSTRAINT pk_cliente;
       public                 postgres    false    218            �           2606    16497    solicitud pk_solicitud 
   CONSTRAINT     ^   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud);
 @   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT pk_solicitud;
       public                 postgres    false    222            �           2606    16635 #   asignacion pk_solicitud_colaborador 
   CONSTRAINT     {   ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT pk_solicitud_colaborador PRIMARY KEY (id_solicitud, id_colaborador);
 M   ALTER TABLE ONLY public.asignacion DROP CONSTRAINT pk_solicitud_colaborador;
       public                 postgres    false    231    231            �           2606    16487     tipo_solicitud pk_tipo_solicitud 
   CONSTRAINT     m   ALTER TABLE ONLY public.tipo_solicitud
    ADD CONSTRAINT pk_tipo_solicitud PRIMARY KEY (id_tipo_solicitud);
 J   ALTER TABLE ONLY public.tipo_solicitud DROP CONSTRAINT pk_tipo_solicitud;
       public                 postgres    false    220            �           2606    16614    trabajador pk_trabajador 
   CONSTRAINT     ^   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT pk_trabajador PRIMARY KEY (id_usuario);
 B   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT pk_trabajador;
       public                 postgres    false    230            �           2606    16581    usuario pk_usuario 
   CONSTRAINT     X   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);
 <   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_usuario;
       public                 postgres    false    228            �           2606    16560    venta pk_venta 
   CONSTRAINT     R   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT pk_venta PRIMARY KEY (id_venta);
 8   ALTER TABLE ONLY public.venta DROP CONSTRAINT pk_venta;
       public                 postgres    false    226            �           2606    16599    colaborador uk_colaborador 
   CONSTRAINT     `   ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT uk_colaborador PRIMARY KEY (id_usuario);
 D   ALTER TABLE ONLY public.colaborador DROP CONSTRAINT uk_colaborador;
       public                 postgres    false    229            �           2606    16554    aplicacion uk_nombre_aplicacion 
   CONSTRAINT     \   ALTER TABLE ONLY public.aplicacion
    ADD CONSTRAINT uk_nombre_aplicacion UNIQUE (nombre);
 I   ALTER TABLE ONLY public.aplicacion DROP CONSTRAINT uk_nombre_aplicacion;
       public                 postgres    false    224            �           2606    16583     usuario uk_num_documento_usuario 
   CONSTRAINT     d   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_num_documento_usuario UNIQUE (num_documento);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uk_num_documento_usuario;
       public                 postgres    false    228            �           2606    16672    usuario usuario_username_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_unique UNIQUE (username);
 I   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_username_unique;
       public                 postgres    false    228            �           2606    16654    atencion fk_atencion_asignacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT fk_atencion_asignacion FOREIGN KEY (id_solicitud, id_colaborador) REFERENCES public.asignacion(id_solicitud, id_colaborador);
 I   ALTER TABLE ONLY public.atencion DROP CONSTRAINT fk_atencion_asignacion;
       public               postgres    false    233    231    233    4764    231            �           2606    16600 "   colaborador fk_colaborador_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT fk_colaborador_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.colaborador DROP CONSTRAINT fk_colaborador_usuario;
       public               postgres    false    4754    228    229            �           2606    16641    asignacion fk_sc_colaborador    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT fk_sc_colaborador FOREIGN KEY (id_colaborador) REFERENCES public.colaborador(id_usuario);
 F   ALTER TABLE ONLY public.asignacion DROP CONSTRAINT fk_sc_colaborador;
       public               postgres    false    229    4760    231            �           2606    16636    asignacion fk_sc_solicitud    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignacion
    ADD CONSTRAINT fk_sc_solicitud FOREIGN KEY (id_solicitud) REFERENCES public.solicitud(id_solicitud);
 D   ALTER TABLE ONLY public.asignacion DROP CONSTRAINT fk_sc_solicitud;
       public               postgres    false    222    231    4746            �           2606    16664 !   solicitud fk_solicitud_aplicacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitud_aplicacion FOREIGN KEY (id_aplicacion) REFERENCES public.aplicacion(id_aplicacion);
 K   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitud_aplicacion;
       public               postgres    false    4748    224    222            �           2606    16503    solicitud fk_solicitud_tipo    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitud_tipo FOREIGN KEY (id_tipo_solicitud) REFERENCES public.tipo_solicitud(id_tipo_solicitud);
 E   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitud_tipo;
       public               postgres    false    220    222    4744            �           2606    16659 !   solicitud fk_solicitud_trabajador    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT fk_solicitud_trabajador FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_usuario);
 K   ALTER TABLE ONLY public.solicitud DROP CONSTRAINT fk_solicitud_trabajador;
       public               postgres    false    230    222    4762            �           2606    16615     trabajador fk_trabajador_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT fk_trabajador_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 J   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT fk_trabajador_cliente;
       public               postgres    false    4742    218    230            �           2606    16620     trabajador fk_trabajador_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT fk_trabajador_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT fk_trabajador_usuario;
       public               postgres    false    4754    230    228            �           2606    16566    venta fk_venta_aplicacion    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fk_venta_aplicacion FOREIGN KEY (id_aplicacion) REFERENCES public.aplicacion(id_aplicacion);
 C   ALTER TABLE ONLY public.venta DROP CONSTRAINT fk_venta_aplicacion;
       public               postgres    false    224    226    4748            �           2606    16561    venta fk_venta_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 @   ALTER TABLE ONLY public.venta DROP CONSTRAINT fk_venta_cliente;
       public               postgres    false    218    4742    226            B   [   x�3�t
PpK,�ML�L�2s���J�rR���ܜ���k�K2��9��RsRR
��L8��KJ���+�KRs�b���� �V      I   k   x�u��� ��s;�`Z���	�?�1��p���� <��(:���>�@�R�06]��\���z�6���i�Y2V]�!b�D�N}Dֹ��/q�q2YR�{G��bC      K   �  x������0Ek���$�iӦs�fz�&B"��߼��������c��L
fą9��wQ�ΪL����FV �Z�u�/��M;���9]�8h�;� ��&�!b2�/�[c1� 4����Ͷ˯�����x]�=k��Gh������d`��"���.|�^��,	�Z�(Y��?�w�/7�����/4]+u�N
�lM������=������=8L�:]b7�I�Y�2*k�]U�.X�B�fzs���d��mf��9�6 ��^�9
�~TR��4��U&U&�;_ e�w������X=����tMO�H���[K�4�M��s6l�g#���",�P���X�ҮƽC?L�a96h����ќ��z��D�9��4����J��r�y�<�y��:e8��?���ikљ$�|2ԋ���4��Pq��q���|7�!��*MAE=c����Ì���h"7�}/����a<��G3�l-WKI�����7�Z/      <   �  x�u��n�0�ח��4؀�������.F�X� �����b�aeV}��XM�R�v�|�w������d�!�J�:�с��!`�	0�>�	T�χ��Y���I�>q���)����V8���0v��c�U�� z����!ʒ���@;�;��F�]��Ľ�����S%q=�F�Q�ʱ-�:�US+ؾ��C����A��q&�E12��̯n�mja���o���|���I4�4	&k��f8�B�E{6��I?�O��1�3�;ʡ�D�b�cO��(S;_Y��'��2���8��C�G~tw!c�"g)<IU��V���RJ�zݕ�].\��c��5�n�N�ү��Ώ���p�t5�����GnP��Q%�i�Y��:�S��v荐�m����t�L	��(j�T�JӉ��,�^֖e�d���      G   B   x���L�K��,.I�24�,(�O/J�ML�/�24�LL����24G�D�02D�12B�#T��qqq y�"r      @   F  x��RKn�0];��4	PʺbW!$�lg�O4�z��r��C��]t7y���g�0+@���4d�I9�'�X܏$���YQ(���_�9y���n�r@�p�a9v�bן�Q%��*�B���Eivk�u0�:��i����F��PEN��Z���D�κ�P=�-�O��KH��V���zk(���B�(t4Hkt��Pa<���#Z�{��9E�x_�Î2{�kVKRc�������S*g���Á�^��]Ј�)1¸���L��l���s9�EKmy� >v����N��nB���?M�U��A��v�Y�� 
��      >   T   x�3�t-*�/RHIU(�O+)O,J�tI-N.�,H�<�9(���
R�Y�e��X���Y��yD�Q(H,JT�I� ����qqq ��,�      H   &   x�3�4�2�4�2bC �Ђӌ��H �1z\\\ TC�      F   <  x����n1���O������(��@(����4��=D���6\r�x���C�m�H�����?���D�ɛ� d��Y^���-���e�5<����WY�Y��R��D�U�=�lP�|�5 #�E��a�L�,v��KX�Xòk���2�r$�U�C:7N�!&���%b�}�p�;���YS5�ǁ~ق��W��9��9f@^�:T�Y1*x�**�}G��vϸ�eq����U������rGq��Z^_�^��PEOG��N��h�`���2����Wg���Y�xY*�"Kc�\������H'���ڲ��s:��
^�	�X�WN�K��ʄ􁦰�t��I�xM�n�l��i�}X��9\9�=Fv�;�7�&,�D�0�%Z�"���}�k�x�kKp�F%+� �x���xR���D.O%�\���i����j�i��@��6���yE�e�d�7���H�"�gF���v�h��Sf4 �VA�=ɞs���0V&����A��+#�j�[U׺�����O�2m���)U�ڨf[wbf�=�^w����f%���A��3;}L��D�q*_��^�oν73�^^��JxJ{GSѴ�5M&�{.���3�v�e��$Ns�YD���Né����U'��lU��:��Z��!NdF���2
mQ���ػ��C�/��`�|��>����~1&�!	rRᴺB�9��o���¾��:��N�LF�>e�P�
MMW鶱৔�&I�:���o�3����I�P��h:쨳蓰�F�,л��u��G�0!M�L�a�:J�U}���jT��U�9����:Ǡϰ���/�1���]+      D   L   x�U̻�@����!�'z��:p��9}���ri.n�6��'�b�'xCMp�	������N�S�/%��sx¿�     