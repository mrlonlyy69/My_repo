import pygame
import pgzrun

WIDTH = 800
HEIGHT = 600

player = Actor("player_ship", (WIDTH / 2, HEIGHT - 50))
player_speed = 5

aliens = []
alien_speed = 2

bullets = []
bullet_speed = 7

def update():
    move_player()
    move_aliens()
    move_bullets()
    check_collisions()

def move_player():
    if keyboard.left:
        player.x -= player_speed
    elif keyboard.right:
        player.x += player_speed

    if player.left < 0:
        player.left = 0
    elif player.right > WIDTH:
        player.right = WIDTH

def move_aliens():
    for alien in aliens:
        alien.y += alien_speed

def move_bullets():
    for bullet in bullets:
        bullet.y -= bullet_speed

def check_collisions():
    global aliens, bullets

    for bullet in bullets:
        for alien in aliens:
            if bullet.colliderect(alien):
                aliens.remove(alien)
                bullets.remove(bullet)
                break

def on_key_down(key):
    if key == keys.SPACE:
        bullets.append(Actor("bullet", (player.x, player.y - 30)))

def draw():
    screen.clear()
    player.draw()
    for alien in aliens:
        alien.draw()
    for bullet in bullets:
        bullet.draw()

def create_aliens():
    for x in range(50, WIDTH - 50, 100):
        aliens.append(Actor("alien", (x, 50)))

create_aliens()
pgzrun.go()

