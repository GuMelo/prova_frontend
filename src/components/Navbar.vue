<template>
  <div>
      <b-navbar id="navbar" toggleable="lg" type="dark" fixed>
        <b-navbar-brand href="/">Crypto J.</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item to="/">Home</b-nav-item>
            <b-nav-item to="/jaspioncoin">Jaspioncoin</b-nav-item>
            <b-nav-item to="/jibancoin">Jibancoin</b-nav-item>
            <b-nav-item to="/jirayacoin">Jirayacoin</b-nav-item>
          </b-navbar-nav>

        </b-collapse>
      </b-navbar>
    </div>
</template>

<script>
export default {
  name: 'Navbar'
}
</script>

<style>
  #navbar {
    background: #244D68;
    padding: 10px 20px;
    position: fixed;
    width: 100%;
    z-index: 1;
    /* height: 60px; */
  }
  .nav-item {
    margin: 0 10px;
  }
</style>
